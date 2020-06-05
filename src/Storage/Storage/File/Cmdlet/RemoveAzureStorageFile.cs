﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

namespace Microsoft.WindowsAzure.Commands.Storage.File.Cmdlet
{
    using Microsoft.Azure.Storage.File;
<<<<<<< HEAD
    using System.Globalization;
    using System.Management.Automation;

    [Cmdlet("Remove", Azure.Commands.ResourceManager.Common.AzureRMConstants.AzurePrefix + "StorageFile",SupportsShouldProcess = true,DefaultParameterSetName = Constants.ShareNameParameterSetName), OutputType(typeof(CloudFile))]
=======
    using Microsoft.WindowsAzure.Commands.Common.CustomAttributes;
    using Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel;
    using System.Globalization;
    using System.Management.Automation;

    [Cmdlet("Remove", Azure.Commands.ResourceManager.Common.AzureRMConstants.AzurePrefix + "StorageFile",SupportsShouldProcess = true,DefaultParameterSetName = Constants.ShareNameParameterSetName), OutputType(typeof(AzureStorageFile))]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    public class RemoveAzureStorageFile : AzureStorageFileCmdletBase
    {
        [Parameter(
            Position = 0,
            Mandatory = true,
            ParameterSetName = Constants.ShareNameParameterSetName,
            HelpMessage = "Name of the file share where the file would be removed.")]
        [ValidateNotNullOrEmpty]
        public string ShareName { get; set; }

        [Parameter(
            Position = 0,
            Mandatory = true,
            ValueFromPipeline = true,
<<<<<<< HEAD
            ParameterSetName = Constants.ShareParameterSetName,
            HelpMessage = "CloudFileShare object indicated the share where the file would be removed.")]
        [ValidateNotNull]
=======
            ValueFromPipelineByPropertyName = true,
            ParameterSetName = Constants.ShareParameterSetName,
            HelpMessage = "CloudFileShare object indicated the share where the file would be removed.")]
        [ValidateNotNull]
        [Alias("CloudFileShare")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public CloudFileShare Share { get; set; }

        [Parameter(
            Position = 0,
            Mandatory = true,
            ValueFromPipeline = true,
<<<<<<< HEAD
            ParameterSetName = Constants.DirectoryParameterSetName,
            HelpMessage = "CloudFileDirectory object indicated the cloud directory where the file would be removed.")]
        [ValidateNotNull]
=======
            ValueFromPipelineByPropertyName = true,
            ParameterSetName = Constants.DirectoryParameterSetName,
            HelpMessage = "CloudFileDirectory object indicated the cloud directory where the file would be removed.")]
        [ValidateNotNull]
        [Alias("CloudFileDirectory")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public CloudFileDirectory Directory { get; set; }

        [Parameter(
            Position = 0,
            Mandatory = true,
            ValueFromPipeline = true,
<<<<<<< HEAD
            ParameterSetName = Constants.FileParameterSetName,
            HelpMessage = "CloudFile object indicated the file to be removed.")]
        [ValidateNotNull]
=======
            ValueFromPipelineByPropertyName = true,
            ParameterSetName = Constants.FileParameterSetName,
            HelpMessage = "CloudFile object indicated the file to be removed.")]
        [ValidateNotNull]
        [Alias("CloudFile")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public CloudFile File { get; set; }

        [Parameter(
            Position = 1,
            Mandatory = true,
            ParameterSetName = Constants.ShareNameParameterSetName,
            HelpMessage = "Path of the file to be removed.")]
        [Parameter(
            Position = 1,
            Mandatory = true,
            ParameterSetName = Constants.ShareParameterSetName,
            HelpMessage = "Path of the file to be removed.")]
        [Parameter(
            Position = 1,
            Mandatory = true,
            ParameterSetName = Constants.DirectoryParameterSetName,
            HelpMessage = "Path of the file to be removed.")]
        [ValidateNotNullOrEmpty]
        public string Path { get; set; }

        [Parameter(HelpMessage = "Returns an object representing the removed file. By default, this cmdlet does not generate any output.")]
        public SwitchParameter PassThru { get; set; }

        public override void ExecuteCmdlet()
        {
            string[] path = NamingUtil.ValidatePath(this.Path, true);
            CloudFile fileToBeRemoved;
            switch (this.ParameterSetName)
            {
                case Constants.FileParameterSetName:
                    fileToBeRemoved = this.File;
                    break;

                case Constants.ShareNameParameterSetName:
                    var share = this.BuildFileShareObjectFromName(this.ShareName);
                    fileToBeRemoved = share.GetRootDirectoryReference().GetFileReferenceByPath(path);
                    break;

                case Constants.ShareParameterSetName:
                    fileToBeRemoved = this.Share.GetRootDirectoryReference().GetFileReferenceByPath(path);
                    break;

                case Constants.DirectoryParameterSetName:
                    fileToBeRemoved = this.Directory.GetFileReferenceByPath(path);
                    break;

                default:
                    throw new PSArgumentException(string.Format(CultureInfo.InvariantCulture, "Invalid parameter set name: {0}", this.ParameterSetName));
            }

            this.RunTask(async taskId =>
            {
                if (this.ShouldProcess(fileToBeRemoved.GetFullPath(), "Remove file"))
                {
                    await this.Channel.DeleteFileAsync(fileToBeRemoved, null, this.RequestOptions, this.OperationContext, this.CmdletCancellationToken).ConfigureAwait(false);
                }

                if (this.PassThru)
                {
<<<<<<< HEAD
                    this.OutputStream.WriteObject(taskId, fileToBeRemoved);
=======
                    WriteCloudFileObject(taskId, this.Channel, fileToBeRemoved);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                }
            });
        }
    }
}
