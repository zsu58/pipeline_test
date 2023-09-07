CREATE OR REPLACE PROCEDURE snubh_dm.ed_test0(start_var text, end_var text)
 LANGUAGE plpgsql
AS $procedure$
	BEGIN
		INSERT INTO snubh_dm.ed_test
		SELECT *
		FROM (
			SELECT start_var AS t
			UNION ALL
			SELECT end_var AS t
		) a;
	END;
$procedure$
;
