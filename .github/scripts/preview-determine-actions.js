const { getPrState, getPrLabels } = require('./utils');

module.exports = async ({ github, context, core }) => {
  const labels = await getPrLabels(context);
  const state = await getPrState(github, context);

  const shouldDeploy = labels.includes('preview');
  const shouldApply = !state && shouldDeploy;
  const shouldDestroy = state  && !shouldDeploy;

  console.log({ shouldApply, shouldDestroy, shouldDeploy });
  console.log(JSON.stringify({ context, github }, null, 2));

  core.setOutput('should-apply', shouldApply);
  core.setOutput('should-destroy', shouldDestroy);
  core.setOutput('should-deploy', shouldDeploy);
}
