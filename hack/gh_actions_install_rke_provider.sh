#!/usr/bin/env sh

#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Copyright 2020 NetApp
#

RKE_PROVIDER_VERSION=1.0.0

curl -LO https://github.com/rancher/terraform-provider-rke/releases/download/${RKE_PROVIDER_VERSION}/terraform-provider-rke-linux-amd64.tar.gz
tar -xzf terraform-provider-rke-linux-amd64.tar.gz
mkdir -p terraform.d/plugins/linux_amd64/
mv terraform-provider-rke-*/terraform-provider-rke terraform.d/plugins/linux_amd64/terraform-provider-rke
