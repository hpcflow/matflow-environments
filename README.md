# matflow-environments
Sources for generating matflow environments via conda and docker

## Unpacking/installing a "packed" conda environment

### Linux/MacOS

- Download the compressed tarball (e.g. `damask_parse_env-linux.tar.gz` from the GitHub actions artifacts)
- Extract and unpack like so (where you might need to change `env_name`):

  ```bash
  env_name=damask_parse_env-linux
  mkdir $env_name
  tar -xzf ${env_name}.tar.gz -C $env_name
  source $env_name/bin/activate
  conda-unpack
  ```
- Once extracted, the environment can be activated and deactivate like so:

  ```bash
  source /path/to/env/bin/activate
  source /path/to/env/bin/deactivate
  ```

### Windows


- Download the compressed tarball (e.g. `damask_parse_env-win.tar.gz` from the GitHub actions artifacts)
- Extract and unpack like so, using Powershell, (where you might need to change `env_name`):

  ```powershell
  $env_name = "damask_parse_env-win"
  mkdir $env_name
  tar -xzf .\${env_name}.tar.gz -C $env_name
  cmd /c ".\${env_name}\Scripts\activate.bat && ${env_name}\Scripts\conda-unpack.exe"
  ```

- Once extracted, activation/deactivation must be performed within cmd.exe (not Powershell), like so:

  ```powershell
  cmd
  \path\to\env\Scripts\activate.bay
  \path\to\env\Scripts\deactivate.bay
  ```

 
