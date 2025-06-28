const { getPrState, getPrLabels, persistPrState } = require('./utils');

module.exports = async ({ github, context }, newState) => {
  const { state } = (await getPrState(github, context)) || {};

  await persistPrState(github, context, {
    ...state,
    ...newState
  });
}
