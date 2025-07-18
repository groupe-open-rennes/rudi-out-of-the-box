# Config Baker

The Config Baker container may be used to execute all sorts of tasks around setting up, preparing and finalizing
an instance of the Dataverse software. Its focus is bootstrapping non-initialized installations.

You may use this image as is, base your own derivative image on it or use bind mounts to change behavior.

## Quick Reference

**Maintained by:** 

This image is created, maintained and supported by the Dataverse community on a best-effort basis.

**Where to find documentation:**

The [Dataverse Container Guide - Config Baker Image](https://guides.dataverse.org/en/latest/container/configbaker-image.html)
provides information about this image. 

**Where to get help and ask questions:**

IQSS will not offer support on how to deploy or run it. Please reach out to the community for help on using it.
You can join the Community Chat on Matrix at https://chat.dataverse.org and https://groups.google.com/g/dataverse-community
to ask for help and guidance.

## Supported Image Tags

This image is sourced within the main upstream code [repository of the Dataverse software](https://github.com/IQSS/dataverse).
Development and maintenance of the [image's code](https://github.com/IQSS/dataverse/tree/develop/modules/container-configbaker)
happens there (again, by the community). Community-supported image tags are based on the two most important branches:

- The `unstable` tag corresponds to the `develop` branch, where pull requests are merged.
  ([`Dockerfile`](https://github.com/IQSS/dataverse/tree/develop/modules/container-configbaker/src/main/docker/Dockerfile))
- The `alpha` tag corresponds to the `master` branch, where releases are cut from.
  ([`Dockerfile`](https://github.com/IQSS/dataverse/tree/master/modules/container-configbaker/src/main/docker/Dockerfile))

## License

Image content created by the community is licensed under [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0), 
like the [main Dataverse project](https://github.com/IQSS/dataverse/blob/develop/LICENSE.md).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and limitations under the License.

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies
with any relevant licenses for all software contained within.
