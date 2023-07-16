cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/apps/vcsmx/vcs/S-2021.09//bin
export VCS_VERSION=S-2021.09
export VCS_PATH=/apps/vcsmx/vcs/S-2021.09//bin
export LM_LICENSE_FILE=27020@10.116.0.5
export VCS_HOME=/apps/vcsmx/vcs/S-2021.09/
export HOME=/home/runner
chmod +x run.bash; sed -i -e 's/\r//g' run.bash; ./run.bash  ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip