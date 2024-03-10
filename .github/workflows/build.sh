name: checkout
on:
  # Triggers the workflow on push or pull request events but only for the "master" branch
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:
# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v3
      - uses: actions/checkout@v3
        with:
          repository: "chobits/ngx_http_proxy_connect_module"
      - name: build
        run: ./build.sh
#      - name: Run a multi-line script
#        run: |
#          echo Add other actions to build,
#          echo test, and deploy your project.