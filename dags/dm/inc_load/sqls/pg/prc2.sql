CREATE OR REPLACE PROCEDURE dw.ed_test1(start_var text, end_var text)
 LANGUAGE plpgsql
AS $procedure$
	BEGIN
		INSERT INTO dw.ed_test
		SELECT *
		FROM (
			SELECT start_var AS t
			UNION ALL
			SELECT end_var AS t
		) a;
	END;
$procedure$
;
