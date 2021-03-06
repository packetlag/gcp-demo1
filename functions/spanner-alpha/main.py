# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

################################################
# Andy's updated this to fit gcp-demo1 project #
################################################


# [START spanner_functions_quickstart]
from google.cloud import spanner

instance_id = 'gcp-demo1-alpha'
database_id = 'gcp-demo1-db'

client = spanner.Client()
instance = client.instance(instance_id)
database = instance.database(database_id)


def spanner_read_data(request):
    query = 'SELECT * FROM demo1'

    outputs = []
    with database.snapshot() as snapshot:
        results = snapshot.execute_sql(query)

        for row in results:
            output = '{}'.format(*row)
            outputs.append(output)

    return '\n'.join(outputs)
# [END spanner_functions_quickstart]
