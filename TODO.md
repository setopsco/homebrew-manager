# Additional steps required to make setops/manager available via [Homebrew](https://brew.sh/index_de)
The official Homebrew Formula documentation can be found [here](https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md). Tutorial available [here](https://tech.cars.com/distributing-your-home-grown-tools-to-the-masses-with-homebrew-acb7a62518a8).

1. Create a new github repository for the formula; prefix with `homebrew-` (see [reference](https://github.com/TheHipbot/homebrew-hb-osx)) :white_check_mark:
2. Push this repository to the remote
3. Create a binary release for the `CLI` as `.tar.gz`
   - Current [Issue](https://github.com/actions/upload-artifact/issues/109) delivers any file type as `.zip` when downloading artifacts
   - Alternatives..?
4. Make the binary release available
   - Create Access Token
   - 
5. Add a LICENSE