
# Nix Flake Actions

This action lets you more easily publish a flake to FlakeHub, and let's you do
one or more of the following:

- Publish your flake to [FlakeHub's Flake Registry](https://flakehub.com/flakes)
- Publish your flake's output(s) to FlakeHub's binary cache
- Publish your flake's output(s) to a Cachix binary cache

## Inputs

"Strictly Required" means that a non-null value is required. If a default is set,
you do not need to provide this value.

"Required If Set" means that this value becomes required under certain conditions.
You must provide this value if those conditions are met and it does not have a
default value set.

|Name|Description|Strictly Required|Default|Required If Set|
|----|-----------|-----------------|-------|---------------|
|nix-action-version|The version of the 'determinate-nix-action' action to use.|true|v3.21.0||
|flakehub-flake-action-version|The version of the 'flakehub-push' action to use.|true|v6||
|flakehub-cache-action-version|The version of the 'flakehub-cache-action' action to use.|true|v3.21.0||
|nix-extra-conf|Extra lines that go in nix.conf|false||false|
|nixpkgs-flake-ref|The nixpkgs flake-ref to use (such as `github:NixOS/nixpkgs/26.05`).|true|github:NixOS/nixpkgs/26.05||
|flakehub-flake-repository|The GitHub repository containing your flake in the format of `{org}/{repo}`.|false|||
|flakehub-flake-tags|Comma-separated values that the published flake is labeled with that are alphanumeric + hyphens only.|false|||
|flakehub-versioning-kind|Whether to publish using tags or a rolling release. ('tagged'/'rolling')|true|||
|flakehub-release-tag|The Git tag to use for non-rolling releases. This must be the character `v` followed by a SemVer version, such as `v0.1.1`.|false||flakehub-versioning-kind=='tagged'|
|flakehub-release-rolling-minor|Specify the SemVer minor version of your rolling releases. All releases will follow the versioning scheme `0.[rolling-minor].[commit count]+rev-[git sha]`.|false||flakehub-versioning-kind=='rolling'|
|cache-flake-outputs|Comma-separated list of flake outputs to cache with FlakeHub.|"default"||cache-enable-flakehub \|\| cache-enable-cachix|
|cache-enable-flakehub|Whether or not to update the FlakeHub binary cache with the flake outputs specified in `cached-flake-outputs`.|false|false||
|cache-enable-cachix|Whether or not to update the Cachix binary cache with the flake outputs specified in `cache-flake-outputs`.|false|false||
|cache-name-cachix|The name of the cachix cache to push to.|false||cache-enabled-cachix|
|cache-upstream-flakehub|Your preferred upstream cache. Store paths in this store will not be cached in the FlakeHub cache.|false|||

