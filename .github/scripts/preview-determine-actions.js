const { getPrState, getPrLabels } = require('./utils');

module.exports = async ({ github, context, core }) => {
  const labels = await getPrLabels(context);
  const state = await getPrState(github, context);

  const shouldDeploy = labels.includes('preview') && context.payload.action !== 'closed';
  const shouldDestroy = context.payload.action === 'closed' || (!!state && !shouldDeploy);

  core.setOutput('should-destroy', shouldDestroy);
  core.setOutput('should-deploy', shouldDeploy);
}
