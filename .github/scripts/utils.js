async function getPrNumber(context) {
  const prNumber = context.payload.pull_request.number;
  return prNumber;
}

async function getPrLabels(context) {
  const labels = context.payload.pull_request.labels.map(label => label.name);
  return labels;
}

async function getPrComments(github, context) {
  const comments = await github.rest.issues.listComments({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: context.payload.pull_request.number,
  });

  return comments;
}

async function getPrStateComment(github, context) {
  const prNumber = getPrNumber(context);
  const comments = await getPrComments(github, context);
  const stateComment = comments.find(comment => comment.body.includes('<-- preview-state'))

  return stateComment;
}

async function getPrState(github, context) {
  const stateComment = await getPrStateComment(github, context);
  const stateRegex = /<-- preview-state\n(.*)\n-->/;
  const state = stateComment.body.match(stateRegex)[1];

  return {
    commentId: stateComment.id,
    state: JSON.parse(state),
  };
}

async function persistPrState(github, context, state) {
  const { state: previousState, commentId } = await getPrState(github, context);

  if (previousState) {
    await github.rest.issues.updateComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      comment_id: commentId,
      body: `<-- preview-state\n${JSON.stringify(state)}\n-->`,
    });
  } else {
    await github.rest.issues.createComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      issue_number: context.payload.pull_request.number,
      body: `<-- preview-state\n${JSON.stringify(state)}\n-->`,
    });
  }
  
  return JSON.parse(state);
}

module.exports = {
  getPrNumber,
  getPrLabels,
  getPrComments,
  getPrStateComment,
  getPrState,
  persistPrState,
};
