Describe $($PSCommandPath -Replace '.Tests.ps1') {

    BeforeAll {
        #Get Current Directory
        $Here = Split-Path -Parent $PSCommandPath

        #Assume ModuleName from Repository Root folder
        $ModuleName = Split-Path (Split-Path $Here -Parent) -Leaf

        #Resolve Path to Module Directory
        $ModulePath = Resolve-Path "$Here\..\$ModuleName"

        #Define Path to Module Manifest
        $ManifestPath = Join-Path "$ModulePath" "$ModuleName.psd1"

        if ( -not (Get-Module -Name $ModuleName -All)) {

            Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop

        }

        $Script:RequestBody = $null
        $Script:BaseURI = 'https://SomeURL/SomeApp'
        $Script:ExternalVersion = '0.0'
        $Script:WebSession = New-Object Microsoft.PowerShell.Commands.WebRequestSession

    }


    AfterAll {

        $Script:RequestBody = $null

    }

    InModuleScope $(Split-Path (Split-Path (Split-Path -Parent $PSCommandPath) -Parent) -Leaf ) {

        BeforeEach {
            $Script:ExternalVersion = '0.0'

            Mock Invoke-PASRestMethod -MockWith {
            }

            $InputObject = [PSCustomObject]@{

                AccountID          = '12_3'
                safe               = 'SomeSafeName'
                extraPasswordIndex = 1
                name               = 'SomeAccountName'
                folder             = 'SomeFolder'

            }

            $response = $InputObject | Set-PASLinkedAccount

        }

        Context 'Input' {

            It 'sends request' {

                Assert-MockCalled Invoke-PASRestMethod -Times 1 -Exactly -Scope It

            }

            It 'sends request to expected endpoint' {

                Assert-MockCalled Invoke-PASRestMethod -ParameterFilter {

                    $URI -eq "$($Script:BaseURI)/api/Accounts/12_3/LinkAccount"

                } -Times 1 -Exactly -Scope It

            }

            It 'uses expected method' {

                Assert-MockCalled Invoke-PASRestMethod -ParameterFilter { $Method -match 'POST' } -Times 1 -Exactly -Scope It

            }

            It 'sends request with expected body' {

                Assert-MockCalled Invoke-PASRestMethod -ParameterFilter {
                    $($Body | ConvertFrom-Json) -ne $null
                } -Times 1 -Exactly -Scope It

            }

            It 'throws error if version requirement not met' {
                $Script:ExternalVersion = '1.0'
                { $InputObject | Set-PASLinkedAccount } | Should -Throw
                $Script:ExternalVersion = '0.0'
            }

        }

        Context 'Output' {

            It 'provides no output' {

                $response | Should -BeNullOrEmpty

            }

        }

    }

}