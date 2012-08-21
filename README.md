Overview

This is a Redmine 2.x plugin to display information about securities listed on https://cryptostocks.com

It adds a tabe called "Ticker" to the project menu of projects who have maintained the a project custom field with the security ticker symbol.

Installation notes

Download the package from https://github.com/Cryptostocks/Redmine4Cryptostocks

Unpack the contents into #{RAILS_ROOT}/plugins or git clone https://github.com/Cryptostocks/Redmine4Cryptostocks.git

In #{RAILS_ROOT} run the command rake redmine:plugins:migrate

Restart Redmine

Configure Redmine

In menu Administration->Custom Fields->Projects create a new field called CRYPTOSTOCKS_TICKER

Maintain this field in the projects that should show Cryptostocks ticker information with the ticker name of the security.

Changelog v00.01 - 2012-08-18 Initial Version


