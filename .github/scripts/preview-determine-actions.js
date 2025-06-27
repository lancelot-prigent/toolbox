module.exports = async ({ github, context, core }) => {
  console.log({ github, context, core });

  core.setOutput('should-apply', false);
  core.setOutput('should-destroy', false);
  core.setOutput('should-deploy', false);
}
