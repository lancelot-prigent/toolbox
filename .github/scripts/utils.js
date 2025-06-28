/**
 * @typedef {import('octokit').Octokit} GitHub
 */

async function getPrNumber(context) {
  const prNumber = context.payload.pull_request.number;
  return prNumber;
}

/**
 * @returns {Promise<string[]>}
 */
async function getPrLabels(context) {
  const labels = context.payload.pull_request.labels.map(label => label.name);
  return labels;
}

/**
 * @param {GitHub} github
 */
async function getPrComments(github, context) {
  const res = await github.rest.issues.listComments({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: context.payload.pull_request.number,
  });

  return res.data;
}

/**
 * @param {GitHub} github
 */
async function getPrState(github, context) {
  const comments = await getPrComments(github, context);
  const stateComment = comments.find(comment => comment.body?.includes('<!-- preview-state'))
  
  if (!stateComment) return null;
  
  const stateRegex = /<!-- preview-state (.*) -->/;
  const state = stateComment.body.match(stateRegex)?.[1];

  return {
    commentId: stateComment.id,
    state: JSON.parse(state),
  };
}

/**
 * @param {GitHub} github
 */
async function persistPrState(github, context, state) {
  const { state: previousState, commentId } = (await getPrState(github, context)) || {};

  if (previousState) {
    await github.rest.issues.updateComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      comment_id: commentId,
      body: generatePrStateComment(state),
    });
  } else {
    await github.rest.issues.createComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      issue_number: context.payload.pull_request.number,
      body: generatePrStateComment(state),
    });
  }
}

function generatePrStateComment(state)  {
  const stateString = `<!-- preview-state ${JSON.stringify(state)} -->`;
  let body = '';

  switch (state?.deploy) {
    case 'deploying':
      body = `:yellow_circle: Deploying...`;
      break;
    case 'deployed':
      body = `:green_circle: Deployed!`;
      break;
    case 'destroying':
      body = `:yellow_circle: Destroying...`;
      break;
    case 'destroyed':
      body = `:red_circle: Destroyed!`;
      break;
    case 'failure':
      body = `:x: Failed!`;
      break;
    default:
      body = `:white_circle: No state`;
      break;
  }

  return `${stateString}\n\n${body}`;
}

module.exports = {
  getPrNumber,
  getPrLabels,
  getPrComments,
  getPrState,
  persistPrState,
};
