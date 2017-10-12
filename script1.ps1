cd\
Enter-PSSession agtest
cd\
Invoke-Sqlcmd
Set-Location SQLSERVER:\SQL\agtest\DEFAULT\databases\SSISDB
Invoke-Sqlcmd -Query "SELECT GETDATE() AS TimeOfQuery;" -Verbose
Invoke-Sqlcmd -Query "DECLARE @ProjectBinary as varbinary(max);DECLARE @operation_id as bigint ; Set @ProjectBinary = (SELECT * FROM OPENROWSET(BULK 'C:\Test\Share\jeet_test.ispac', SINGLE_BLOB) as BinaryData); Exec catalog.deploy_project @folder_name = 'jeet_test', @project_name = 'jeet_test', @Project_Stream = @ProjectBinary, @operation_id = @operation_id out;" -Verbose