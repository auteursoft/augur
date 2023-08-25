#!/bin/sh
echo "starting api_get_all_repos_prs"
psql -U augur -h data.chaoss.io -p 5432 -d augur -c 'REFRESH MATERIALIZED VIEW augur_data.api_get_all_repo_prs with data;'
echo "starting api_get_all_repos_issues"
psql -U augur -h data.chaoss.io -p 5432 -d augur -c 'REFRESH MATERIALIZED VIEW augur_data.api_get_all_repos_issues with data;'
echo "starting api_get_all_repos_commits_and_committers_daily.."
psql -U augur -h data.chaoss.io -p 5432 -d augur -c 'REFRESH MATERIALIZED VIEW augur_data.explorer_commits_and_committers_daily_count with data;'
echo "staring all repos commits"
psql -U augur -h data.chaoss.io -p 5432 -d augur -c 'REFRESH MATERIALIZED VIEW augur_data.api_get_all_repos_commits with data;'
echo "contributor actions"
psql -U augur -h data.chaoss.io -p 5432 -d augur -c 'REFRESH MATERIALIZED VIEW augur_data.explorer_contributor_actions with data;'
echo "new contributors"
psql -U augur -h data.chaoss.io -p 5432 -d augur -c 'REFRESH MATERIALIZED VIEW augur_data.explorer_new_contributors with data;'
echo "entry list"
psql -U augur -h data.chaoss.io -p 5432 -d augur -c 'REFRESH MATERIALIZED VIEW augur_data.explorer_entry_list with data;'
