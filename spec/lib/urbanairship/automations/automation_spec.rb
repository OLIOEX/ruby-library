require 'spec_helper'
require 'urbanairship'
require 'urbanairship/automations/automation'

describe Urbanairship::Automations do
    UA = Urbanairship
    airship = UA::Client.new(key: '123', secret: 'abc')

    describe Urbanairship::Automations::Automation do

        list_automations_response = {
            "ok": true,
            "pipelines": [
            {
                "creation_time": "2015-03-20T18:37:23",
                "enabled": true,
                "immediate_trigger": {
                    "tag_added": { "tag": "bought_shoes" }
                },
                "last_modified_time": "2015-03-20T19:35:12",
                "name": "Shoe buyers",
                "outcome": {
                    "push": {
                        "audience": "triggered",
                        "device_types": [ "android" ],
                        "notification": { "alert": "So you like shoes, huh?" }
                    }
                },
                "status": "live",
                "uid": "3987f98s-89s3-cx98-8z89-89adjkl29zds",
                "url": "https://go.urbanairship.com/api/pipelines/3987f98s-89s3-cx98-8z89-89adjkl29zds"
            }
            ]
        }

        list_deleted_automations_response = {
            "ok": true,
            "pipelines": [
            {
                "deletion_time": "2014-03-31T20:54:45",
                "pipeline_id": "0sdicj23-fasc-4b2f-zxcv-0baf934f0d69"
            }
            ]
        }

        individual_pipeline_lookup_response = {
            "ok": true,
            "pipeline": {
            "creation_time": "2015-02-14T19:19:19",
            "enabled": true,
            "immediate_trigger": { "tag_added": "new_customer" },
            "last_modified_time": "2015-03-01T12:12:54",
            "name": "New customer",
            "outcome": {
                "push": {
                    "audience": "triggered",
                    "device_types": [ "ios", "android" ],
                    "notification": { "alert": "Hello new customer!" }
                }
            },
            "status": "live",
            "uid": "86ad9239-373d-d0a5-d5d8-04fed18f79bc",
            "url": "https://go.urbanairship/api/pipelines/86ad9239-373d-d0a5-d5d8-04fed18f79bc"
            }
        }

        describe '#format_url_with_params' do
            it 'formats a url with all the queries' do
                automation = UA::Automation.new(client: airship)
                automation.enabled = TRUE
                automation.offset = 5
                automation.limit = 5
                result = automation.format_url_with_params
                expect(result).to eq('?limit=5&enabled=true&offset=5')
            end

            it 'formats a url with two queries' do
                automation = UA::Automation.new(client: airship)
                automation.enabled = TRUE
                automation.limit = 5
                result = automation.format_url_with_params
                expect(result).to eq('?limit=5&enabled=true')
            end

            it 'formats a url with one query' do
                automation = UA::Automation.new(client: airship)
                automation.enabled = TRUE
                result = automation.format_url_with_params
                expect(result).to eq('?enabled=true')
            end
        end

        describe '#list_automations' do 
            it 'returns an 200 code with a properly formatted GET request' do
                automation = UA::Automation.new(client: airship)

                allow(airship).to receive(:send_request).and_return(list_automations_response)
                actual_resp = automation.list_automations
                expect(actual_resp).to eq(list_automations_response)
            end
        end

        describe '#list_deleted_automations' do
            it 'returns a list of deleted pipelines' do 
                automation = UA::Automation.new(client: airship)

                allow(airship).to receive(:send_request).and_return(list_deleted_automations_response)
                actual_resp = automation.list_deleted_automations
                expect(actual_resp).to eq(list_deleted_automations_response)
            end
        end

        describe '#lookup_automation' do
            it 'returns the proper response with a pipeline_id' do
                automation = UA::Automation.new(client: airship)
                automation.pipeline_id = '86ad9239-373d-d0a5-d5d8-04fed18f79bc'

                allow(airship).to receive(:send_request).and_return(individual_pipeline_lookup_response)
                actual_resp = automation.lookup_automation
                expect(actual_resp).to eq(individual_pipeline_lookup_response)
            end

            it 'fails when pipeline_id is not set' do
                automation = UA::Automation.new(client: airship)

                allow(airship).to receive(:send_request).and_return(list_deleted_automations_response)
                expect{automation.lookup_automation}.to raise_error(ArgumentError)
            end

        end 

    end

end