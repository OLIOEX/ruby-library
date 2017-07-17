*******
Reports
*******

Individual Push Response Stats
==============================

Returns detailed report information about a specific push notification.
Use the push_id, which is the identifier returned by the API that represents a
specific push message delivery.
For more information, see `the API documentation on individual push statistics
<http://docs.urbanairship.com/api/ua.html#individual-push-response-statistics>`_

.. code-block:: ruby

    require 'urbanairship'
    UA = Urbanairship
    airship = UA::Client.new(key:'application_key', secret:'master_secret')
    d = UA::IndividualResponseStats.new(client: airship)
    statistics = d.get(push_id: 'push_id')


Devices Report
==============

Returns an app’s opted-in and installed device counts broken out by device
type. This endpoint returns the same data that populates the Devices Report.
For more information, see `the API documentation on device reports
<http://docs.urbanairship.com/api/ua.html#devices-report-api>`_

.. code-block:: ruby

    require 'urbanairship'
    UA = Urbanairship
    airship = UA::Client.new(key:'application_key', secret:'master_secret')
    d = UA::DevicesReport.new(client: airship)
    devices = d.get(date: '2015/08/01')


Push Report
===========

Get the number of pushes you have sent within a specified time period.
For more information, see `the API documentation on push reports
<http://docs.urbanairship.com/api/ua.html#push-report>`_

.. code-block:: ruby

    require 'urbanairship'
    UA = Urbanairship
    airship = UA::Client.new(key:'application_key', secret:'master_secret')
    listing = UA::PushList.new(
        client: airship,
        start_date: '2015/06/01',
        end_date: '2015/08/01',
        precision: 'HOURLY'
    )
    listing.each do |resp|
        puts(resp)
    end

.. note::

    precision needs to be a member of ['HOURLY', 'DAILY', 'MONTHLY']


Response Report
===============

Get the number of direct and influenced opens of your app. For more 
information, see `the API documentation on reponse reports
<http://docs.urbanairship.com/api/ua.html#response-report>`_

.. code-block:: ruby

    require 'urbanairship'
    UA = Urbanairship
    airship = UA::Client.new(key:'application_key', secret:'master_secret')
    listing = UA::ResponseReportList.new(
        client: airship,
        start_date: '2015-06-01',
        end_date: '2015-08-01',
        precision: 'MONTHLY'
    )
    listing.each do |resp|
        puts(resp)
    end

.. note::

    precision needs to be a member of ['HOURLY', 'DAILY', 'MONTHLY']


Response Listing
================

Get a listing of all pushes and basic response information in a given
timeframe by instantiating an iterator object using ResponseList.
Start and end date times are required parameters.
For more information, see `the API documentation on response listings
<http://docs.urbanairship.com/api/ua.html#response-listing>`_

.. code-block:: ruby

    require 'urbanairship'
    UA = Urbanairship
    airship = UA::Client.new(key:'application_key', secret:'master_secret')
    response_list = UA::ResponseList.new(
        client: airship,
        start_date: '2015-06-01',
        end_date: '2015-08-01',
        limit: 20,
        push_id_start: 'start_id'
    )
    response_list.each do |resp|
        puts(resp)
    end

.. note::

    limit (optional) is the number of results desired per page.
    push_id_start (optional) specifies the id of the first response to return.


App Opens Report
================

Get the number of users who have opened your app within the specified time 
period. For more information, see `the API documentation on app open reports
<http://docs.urbanairship.com/api/ua.html#app-opens-report>`_

.. code-block:: ruby

    require 'urbanairship'
    UA = Urbanairship
    airship = UA::Client.new(key:'application_key', secret:'master_secret')
    listing = UA::AppOpensList.new(
        client: airship,
        start_date: '2015-06-01',
        end_date: '2015-08-01',
        precision: 'HOURLY')
    listing.each do |app_opens|
        puts(app_opens)
    end

.. note::

    precision needs to be a member of ['HOURLY', 'DAILY', 'MONTHLY']


Time In App Report
==================

Get the average amount of time users have spent in your app within the 
specified time period. For more information, see `the API documentation
on time-in-app reports
<http://docs.urbanairship.com/api/ua.html#time-in-app-report>`_

.. code-block:: ruby

    require 'urbanairship'
    UA = Urbanairship
    airship = UA::Client.new(key:'application_key', secret:'master_secret')
    listing = UA::TimeInAppList.new(
        client: airship,
        start_date: '2015-06-01',
        end_date: '2015-08-01',
        precision: 'HOURLY')
    listing.each do |time_in_app|
        puts(time_in_app)
    end

.. note::

    precision needs to be a member of ['HOURLY', 'DAILY', 'MONTHLY']


Opt-In Report
=============

Get the number of opted-in push users who access the app within the specified 
time period.
For more information, see `the API documentation on opt-in reports
<http://docs.urbanairship.com/api/ua.html#opt-in-report>`_

.. code-block:: ruby

    require 'urbanairship'
    UA = Urbanairship
    airship = UA::Client.new(key:'application_key', secret:'master_secret')
    listing = UA::OptInList.new(
        client: airship,
        start_date: '2015-06-01',
        end_date: '2015-08-01',
        precision: 'HOURLY')
    listing.each do |opt_ins|
        puts(opt_ins)
    end

.. note::

    precision needs to be a member of ['HOURLY', 'DAILY', 'MONTHLY']


Opt-Out Report
==============

Get the number of opted-out push users who access the app within the specified
time period.
For more information, see `the API documentation on opt-out reports
<http://docs.urbanairship.com/api/ua.html#opt-out-report>`_

.. code-block:: ruby

    require 'urbanairship'
    UA = Urbanairship
    airship = UA::Client.new(key:'application_key', secret:'master_secret')
    listing = UA::OptOutList.new(
        client: airship,
        start_date: '2015-06-01',
        end_date: '2015-08-01',
        precision: 'HOURLY')
    listing.each do |opt_outs|
        puts(opt_outs)
    end

.. note::

    precision needs to be a member of ['HOURLY', 'DAILY', 'MONTHLY']
