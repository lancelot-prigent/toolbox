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

  const body = generatePrStateComment(state, context.payload.pull_request.head.sha, context.payload.pull_request.number);
  
  if (previousState) {
    await github.rest.issues.updateComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      comment_id: commentId,
      body,
    });
  } else {
    await github.rest.issues.createComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      issue_number: context.payload.pull_request.number,
      body,
    });
  }
}

function generatePrStateComment(state, commitSha, prNumber)  {
  const stateString = `<!-- preview-state ${JSON.stringify(state)} -->`;
  
  return `${stateString}
🤖 **Preview Environment Status**
  
| Property | Value |
|----------|-------|
| **Environment** | \`pr-${prNumber}\` |
| **Status** | ${getStatusEmoji(state.deploy)} ${state.deploy || 'No state'} |
| **Commit** | \`${commitSha.substring(0, 7)}\` |
| **Updated** | ${new Date().toLocaleString()} |
`
}

function getStatusEmoji(status) {
  const emojis = {
    deploying: '🚀',
    deployed: '✅',
    destroying: '🧹',
    destroyed: '💀',
    failure: '❌'
  };

  return emojis[status] || '❓';
}
module.exports = {
  getPrNumber,
  getPrLabels,
  getPrComments,
  getPrState,
  persistPrState,
};
