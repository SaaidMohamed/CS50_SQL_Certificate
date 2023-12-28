
UPDATE "users"
SET password = '982c0381c279d139fd221fce974916e7'
WHERE "id" = 1;



DELETE FROM "user_logs"
WHERE "id" = (
    SELECT "id"
    FROM "user_logs"
    WHERE "new_password" = '982c0381c279d139fd221fce974916e7'
);



INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
    VALUES ('update', (
    SELECT "username"
    FROM "users"
    WHERE "username" = 'admin'
), (
    SELECT "username"
    FROM "users"
    WHERE "username" = 'admin'
), 'e10adc3949ba59abbe56e057f20f883e', (
    SELECT "password"
    FROM "users"
    WHERE "username" = 'emily33'
) );

