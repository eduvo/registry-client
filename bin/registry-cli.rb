#!/usr/bin/env ruby

$:<<File.expand_path("../../lib", __FILE__)

require "bundler"
require "registry/client/version"
require "registry/client/cli"

Registry::Client::Cli.start