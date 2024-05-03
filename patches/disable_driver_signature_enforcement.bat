title Disabling Driver Signature Enforcement

bcdedit.exe /set loadoptions DISABLE_INTEGRITY_CHECKS


bcdedit.exe /set NOINTEGRITYCHECKS on


bcdedit.exe /set TESTSIGNING ON


bcdedit.exe /v
