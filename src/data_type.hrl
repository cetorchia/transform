-record(data_type, {id,
                    user_profile_id,
                    name,
                    matchers,
                    unique}).
-record(data_matcher, {regex, key_match_spec, value_match_specs}).
-record(data_match_spec, {group_name, group_number}).
