#gemspec-bump

A library for combining `Version`s with `VersionDiff`s into new `Version`s.

##Basic 

The basic functionality is exposed in the CLI via the `versionpatch` and `versionpatch-file` executables.
See README-VERSIONPATCH.md for how to use `versionpatch`.

See the specs or read the code for in-ruby examples of the basic functionality.

## gemspec-bump
`gemspec-bump` it assumes you’re in a git repo that has the VERSION and VERSION_FOR_HUMANS files in its root, of which each contains a version string, and that you’re on a non-master branch (
e.g. a release branch or your develop branch if you’re using git flow).

The executable gets a new version for at least the VERSION version by either opening the VERSION file in your text editor (if no argument is given) or by applying arguments as VersionDiffs to VERSION and VERSION_FOR_HUMANS respectively 
(the latter is optional). It writes the new version(s), creates a commit, merges it with master, tags the master merge commit appropriately, merges the merge commit back to the original branch, and
outputs a reverse, decorated, one-line commit log so that you can see where you’re at.

If you’re on a branch based on master, this whole chain should succeed without any need for additional user input.

See `gemspec-bump --help` for more information.

## What’s it got to do with gemspecs
Nothing. This was made to be used in conjuction with my `gemspec` gem so why not use its namespace.
