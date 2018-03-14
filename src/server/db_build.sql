BEGIN;

DROP TABLE IF EXISTS stims CASCADE;

CREATE TABLE stims (
  id SERIAL PRIMARY KEY,
  stim_id VARCHAR(20) NOT NULL,
  body_part VARCHAR(20) NOT NULL,
  stim_name TEXT NOT NULL,
  instructions TEXT NOT NULL, 
  video_src TEXT, 
  user_id VARCHAR(20) NOT NULL, 
  avatar_name VARCHAR(20) NOT NULL, 
  avatar VARCHAR(20) NOT NULL, 
  avatar_skin_colour VARCHAR(20) NOT NULL, 
  date_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


COMMIT;