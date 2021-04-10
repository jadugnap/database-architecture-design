#! /bin/sh

## Install postgres and initdb ##

# brew install postgres
# initdb --locale=C -E UTF-8 $(brew --prefix)/var/postgres
# psql -l


dropdb hrdb
createdb hrdb
## RUN THIS AFTER hrdb.sql CREATED ##
# psql -d hrdb -f hrdb.sql


# # create tables
psql -d hrdb -c """
CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(25) UNIQUE NOT NULL
);
"""


# # fill up 5 tables
# psql -d hrdb -c """
# -- 1. Fill up "users" tab
# INSERT INTO users ("name") (
#     SELECT DISTINCT username FROM bad_comments
#     UNION
#     SELECT DISTINCT username FROM bad_posts
#     UNION
#     SELECT DISTINCT regexp_split_to_table(upvotes, ',') FROM bad_posts
#     UNION
#     SELECT DISTINCT regexp_split_to_table(downvotes, ',') FROM bad_posts
# );
# """


# ## RUN THIS AFTER create tables & fill up tables are all EXECUTED ##

# pg_dump hrdb > final_hrdb.sql


# ## RUN THIS AFTER final_hrdb.sql DUMPED ##

# psql -d hrdb -f final_hrdb.sql