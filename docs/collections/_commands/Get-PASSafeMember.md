---
category: PSPAS
external help file: psPAS-help.xml
Module Name: psPAS
online version: https://pspas.pspete.dev/commands/Get-PASSafeMember
schema: 2.0.0
title: Get-PASSafeMember
---

# Get-PASSafeMember

## SYNOPSIS
Lists the members of a Safe

## SYNTAX

### Gen2 (Default)
```
Get-PASSafeMember -SafeName <String> [-TimeoutSec <Int32>] [<CommonParameters>]
```

### Gen1-MemberPermissions
```
Get-PASSafeMember -SafeName <String> -MemberName <String> [<CommonParameters>]
```

### Gen1-SafeMembers
```
Get-PASSafeMember -SafeName <String> [-UseGen1API] [<CommonParameters>]
```

### Gen2-MemberFilter
```
Get-PASSafeMember -SafeName <String> [-memberType <String>] [-membershipExpired <Boolean>]
 [-includePredefinedUsers <Boolean>] [-search <String>] [-sort <String>] [-TimeoutSec <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
Lists the members of a Safe.

View Safe Members permission is required.
Defaults to the Gen 2 API which requires 12.0 or higher.
Additional member filter parameters require 12.1 or higher.
Versions lower than 12.0 must specify the `UseGen1API` switch to force use of the Gen1 API.

**Note**
When using the Gen 1 API & querying all members of a safe, the permissions are reported as follows:

- List accounts (ListContent)
- Retrieve accounts	(Retrieve)
- Add accounts, including update properties (Add)
- Update account content (Update)
- Update account properties (UpdateMetadata)
- Rename accounts (Rename)
- Delete accounts (Delete)
- View Audit log (ViewAudit)
- View Safe Members (ViewMembers)
- Use accounts (RestrictedRetrieve)
- Initiate CPM account management operations (\<NOT RETURNED\>)
- Specify next account content (\<NOT RETURNED\>)
- Create folders (AddRenameFolder)
- Delete folders (DeleteFolder)
- Unlock accounts (Unlock)
- Move accounts/folders (MoveFilesAndFolders)
- Manage Safe (ManageSafe)
- Manage Safe Members (ManageSafeMembers)
- Validate Safe Content (ValidateSafeContent)
- Backup Safe (BackupSafe)
- Access Safe without confirmation (\<NOT RETURNED\>)
- Authorize account requests (\<NOT RETURNED\>)

If a Safe Member Name is provided, the full permissions of the member on the Safe will be returned as follows:

- List accounts (ListAccounts)
- Retrieve accounts (RetrieveAccounts)
- Add accounts, including update properties (AddAccounts)
- Update account content (UpdateAccountContent)
- Update account properties (UpdateAccountProperties)
- Rename accounts (RenameAccounts)
- Delete accounts (DeleteAccounts)
- View Audit log (ViewAuditLog)
- View Safe Members (ViewSafeMembers)
- Use accounts (UseAccounts)
- Initiate CPM account management operations (InitiateCPMAccountManagementOperations)
- Specify next account content (SpecifyNextAccountContent)
- Create folders (CreateFolders)
- Delete folders (DeleteFolder)
- Unlock accounts (UnlockAccounts)
- Move accounts/folders (MoveAccountsAndFolders)
- Manage Safe (ManageSafe)
- Manage Safe Members (ManageSafeMembers)
- Validate Safe Content (\<NOT RETURNED\>)
- Backup Safe (BackupSafe)
- Access Safe without confirmation (AccessWithoutConfirmation)
- Authorize account requests (RequestsAuthorizationLevel)

## EXAMPLES

### EXAMPLE 1
```
Get-PASSafeMember -SafeName Target_Safe
```

Lists all members with permissions on Target_Safe

### EXAMPLE 2
```
Get-PASSafeMember -SafeName Target_Safe -MemberName SomeUser
```

Lists all permissions for member SomeUser on Target_Safe

Depreciated from CyberArk Version 12.3

### EXAMPLE 3
```
Get-PASSafeMember -SafeName Target_Safe -UseGen1API
```

Lists all members with permissions on Target_Safe using the Gen1 API.

## PARAMETERS

### -SafeName
The name of the safe to get the members of

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -MemberName
Specify the name of a safe member to return their safe permissions in full.

**NOTE**: An empty PUT request (update) is sent to retrieve full safe permissions for a user:
- You cannot report on the permissions of the user authenticated to the API.
- Reporting on the permissions of the Quota Owner is expected to fail.
- Depreciated from CyberArk Version 12.3

```yaml
Type: String
Parameter Sets: Gen1-MemberPermissions
Aliases: UserName

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -includePredefinedUsers
Filter to include/exclude predefined users in the returned list.

```yaml
Type: Boolean
Parameter Sets: Gen2-MemberFilter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -membershipExpired
Returns either expired members or members that are not expired.

```yaml
Type: Boolean
Parameter Sets: Gen2-MemberFilter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -memberType
Filter members according to the type (user or group)

```yaml
Type: String
Parameter Sets: Gen2-MemberFilter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -search
Search for safe members matching specific strings.

```yaml
Type: String
Parameter Sets: Gen2-MemberFilter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -sort
Sorts results according to the memberName property in ascending order (default) or descending order.

```yaml
Type: String
Parameter Sets: Gen2-MemberFilter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TimeoutSec
See Invoke-WebRequest

Specify a timeout value in seconds

```yaml
Type: Int32
Parameter Sets: Gen2, Gen2-MemberFilter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseGen1API
Force use of the Gen 1 API, for versions earlier than 12.0.

```yaml
Type: SwitchParameter
Parameter Sets: Gen1-SafeMembers
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://pspas.pspete.dev/commands/Get-PASSafeMember](https://pspas.pspete.dev/commands/Get-PASSafeMember)

