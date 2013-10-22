# == Define: icinga::service
#
# wraps nagios_service for icinga specific bits
#
# === Parameters
#
# everything nagios_service supports, including the target
#
# === Examples
#
# node to be monitored
# @@icinga::service { $fqdn: }
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna Corp
#
define icinga::service (
  $target                       = "${icinga::server::params::objects_dir}/service_${name}.cfg",
  $ensure                       = undef,
  $action_url                   = undef,
  $active_checks_enabled        = undef,
  $business_impact              = undef,
  $check_command                = undef,
  $check_freshness              = undef,
  $check_interval               = undef,
  $check_period                 = undef,
  $contact_groups               = undef,
  $contacts                     = undef,
  $display_name                 = undef,
  $event_handler                = undef,
  $event_handler_enabled        = undef,
  $failure_prediction_enabled   = undef,
  $first_notification_delay     = undef,
  $flap_detection_enabled       = undef,
  $flap_detection_options       = undef,
  $freshness_threshold          = undef,
  $high_flap_threshold          = undef,
  $host_name                    = undef,
  $hostgroup_name               = undef,
  $icon_image                   = undef,
  $icon_image_alt               = undef,
  $initial_state                = undef,
  $is_volatile                  = undef,
  $low_flap_threshold           = undef,
  $max_check_attempts           = undef,
  $normal_check_interval        = undef,
  $notes                        = undef,
  $notes_url                    = undef,
  $notification_interval        = undef,
  $notification_options         = undef,
  $notification_period          = undef,
  $notifications_enabled        = undef,
  $obsess_over_service          = undef,
  $parallelize_check            = undef,
  $passive_checks_enabled       = undef,
  $poller_tag                   = undef,
  $process_perf_data            = undef,
  $register                     = undef,
  $retain_nonstatus_information = undef,
  $retain_status_information    = undef,
  $retry_check_interval         = undef,
  $retry_interval               = undef,
  $service_description          = undef,
  $servicegroups                = undef,
  $stalking_options             = undef,
  $use                          = undef,
  $notify                       = Class['::icinga::server::configcheck'],
) {
  include icinga::server::params

  file { $target:
    owner   => $icinga::server::params::icinga_user,
    mode    => 0644,
    require => Nagios_service[$name],
  }

  nagios_service { $name:
    target                       => $target,
    ensure                       => $ensure,
    action_url                   => $action_url,
    active_checks_enabled        => $active_checks_enabled,
    business_impact              => $business_impact,
    check_command                => $check_command,
    check_freshness              => $check_freshness,
    check_interval               => $check_interval,
    check_period                 => $check_period,
    contact_groups               => $contact_groups,
    contacts                     => $contacts,
    display_name                 => $display_name,
    event_handler                => $event_handler,
    event_handler_enabled        => $event_handler_enabled,
    failure_prediction_enabled   => $failure_prediction_enabled,
    first_notification_delay     => $first_notification_delay,
    flap_detection_enabled       => $flap_detection_enabled,
    flap_detection_options       => $flap_detection_options,
    freshness_threshold          => $freshness_threshold,
    high_flap_threshold          => $high_flap_threshold,
    host_name                    => $host_name,
    hostgroup_name               => $hostgroup_name,
    icon_image                   => $icon_image,
    icon_image_alt               => $icon_image_alt,
    initial_state                => $initial_state,
    is_volatile                  => $is_volatile,
    low_flap_threshold           => $low_flap_threshold,
    max_check_attempts           => $max_check_attempts,
    normal_check_interval        => $normal_check_interval,
    notes                        => $notes,
    notes_url                    => $notes_url,
    notification_interval        => $notification_interval,
    notification_options         => $notification_options,
    notification_period          => $notification_period,
    notifications_enabled        => $notifications_enabled,
    obsess_over_service          => $obsess_over_service,
    parallelize_check            => $parallelize_check,
    passive_checks_enabled       => $passive_checks_enabled,
    poller_tag                   => $poller_tag,
    process_perf_data            => $process_perf_data,
    register                     => $register,
    retain_nonstatus_information => $retain_nonstatus_information,
    retain_status_information    => $retain_status_information,
    retry_check_interval         => $retry_check_interval,
    retry_interval               => $retry_interval,
    service_description          => $service_description,
    servicegroups                => $servicegroups,
    stalking_options             => $stalking_options,
    use                          => $use,
    notify                       => $notify,
  }
}
