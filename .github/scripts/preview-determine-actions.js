const { getPrState, getPrLabels } = require('./utils');

module.exports = async ({ github, context, core }) => {
  const labels = await getPrLabels(context);
  const { state } = (await getPrState(github, context)) || {};

  const shouldDeploy = labels.includes('preview');
  const shouldApply = !state && shouldDeploy;
  const shouldDestroy = !!state && !shouldDeploy;

  core.setOutput('shouldApply', shouldApply);
  core.setOutput('shouldDestroy', shouldDestroy);
  core.setOutput('shouldDeploy', shouldDeploy);
}
