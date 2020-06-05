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

namespace Microsoft.Azure.Commands.Resources.Test.ScenarioTests
{
    using System.Collections.Generic;
    using System.Linq;
    using Microsoft.Azure.Management.ResourceManager.Models;

    public class ProviderListBuilder
    {
        private List<ProviderBuilder> Providers { get; } = new List<ProviderBuilder>();

        public ProviderBuilder AddProvider(string name)
        {
            var rv = new ProviderBuilder(name);
            this.Providers.Add(rv);
            return rv;
        }

        public IList<Provider> List => new List<Provider>(this.Providers.Select(item => item.Provider));

        public class ProviderBuilder
        {
            public string Namespace { get; }

            private List<ResourceTypeBuilder> ResourceTypes { get; } = new List<ResourceTypeBuilder>();

            public ProviderBuilder(string providerNamespace)
            {
                this.Namespace = providerNamespace;
            }

            public Provider Provider => new Provider(
                namespaceProperty: this.Namespace,
                resourceTypes: this.ResourceTypes.Select(item => item.ResourceType).ToList(),
                registrationState: "Registered");

            public ResourceTypeBuilder AddResourceType(string resourceType, IEnumerable<string> apiVersions = null, IEnumerable<string> locations = null)
            {
                var rv = new ResourceTypeBuilder(resourceType, apiVersions, locations);
                this.ResourceTypes.Add(rv);
                return rv;
            }
        }

        public class ResourceTypeBuilder
        {
            public static IList<string> DefaultApiVersions { get; } = new List<string> { "2018-01-01", "2016-01-01" };
            public static IList<string> DefaultLocations { get; } = new List<string> { "East US", "West US", "South US" };
            private string Name { get; }
            private List<string> ApiVersions { get; } = new List<string>();
            private List<string> Locations { get; } = new List<string>();
            private List<AliasBuilder> Aliases { get; } = new List<AliasBuilder>();
            public ResourceTypeBuilder(string resourceType, IEnumerable<string> apiVersions = null, IEnumerable<string> locations = null)
            {
                this.Name = resourceType;
                this.ApiVersions.AddRange(apiVersions ?? ResourceTypeBuilder.DefaultApiVersions);
                this.Locations.AddRange(locations ?? ResourceTypeBuilder.DefaultLocations);
            }

            public ProviderResourceType ResourceType => new ProviderResourceType
            {
                ResourceType = this.Name,
                ApiVersions = this.ApiVersions,
                Locations = this.Locations,
                Aliases = this.Aliases.Select(alias => alias.Alias).ToList()
            };

            public AliasBuilder AddAlias(string name)
            {
                var rv = new AliasBuilder(name);
                this.Aliases.Add(rv);
                return rv;
            }
        }

        public class AliasBuilder
        {
            public static IList<string> DefaultApiVersions { get; } = new List<string> { "2018-01-01", "2016-01-01" };
            private string Name { get; }
<<<<<<< HEAD
            private List<AliasPathType> Paths { get; } = new List<AliasPathType>();
=======
            private List<AliasPath> Paths { get; } = new List<AliasPath>();
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

            public AliasBuilder(string name)
            {
                this.Name = name;
            }

<<<<<<< HEAD
            public AliasType Alias => new AliasType
=======
            public Alias Alias => new Alias
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
            {
                Name = this.Name,
                Paths = this.Paths
            };

<<<<<<< HEAD
            public AliasPathType AddAliasPath(string path, IEnumerable<string> apiVersions = null)
            {
                var rv = new AliasPathType
=======
            public AliasPath AddAliasPath(string path, IEnumerable<string> apiVersions = null)
            {
                var rv = new AliasPath
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                {
                    Path = path,
                    ApiVersions = apiVersions?.ToList() ?? AliasBuilder.DefaultApiVersions
                };

                this.Paths.Add(rv);
                return rv;
            }
        }
    }
}
