// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

using System.Collections;
<<<<<<< HEAD
=======
using System.Collections.Generic;
using Microsoft.Azure.Commands.ResourceManager.Cmdlets.SdkModels.Deployments;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
using Microsoft.Azure.Management.ResourceManager.Models;

namespace Microsoft.Azure.Commands.ResourceManager.Cmdlets.SdkModels
{
    public class PSDeploymentCmdletParameters
    {
<<<<<<< HEAD
        public string ResourceGroupName { get; set; }

=======
        public string ManagementGroupId { get; set; }

        public string ResourceGroupName { get; set; }

        public DeploymentScopeType ScopeType { get; set; }

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public string DeploymentName { get; set; }

        public string Location { get; set; }

        public DeploymentMode DeploymentMode { get; set; }

        public string TemplateFile { get; set; }

        public Hashtable TemplateObject { get; set; }

        public Hashtable TemplateParameterObject { get; set; }

        public string ParameterUri { get; set; }

<<<<<<< HEAD
=======
        public IDictionary<string, string> Tags { get; set; }

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public string DeploymentDebugLogLevel { get; set; }

        public OnErrorDeployment OnErrorDeployment { get; set; }
    }
}
