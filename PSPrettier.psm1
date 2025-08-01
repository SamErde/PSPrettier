# Module created by Microsoft.PowerShell.Crescendo
# Version: 1.1.0
# Schema: https://aka.ms/PowerShell/Crescendo/Schemas/2021-11
# Generated at: 08/01/2025 07:25:20
class PowerShellCustomFunctionAttribute : System.Attribute {
    [bool]$RequiresElevation
    [string]$Source
    PowerShellCustomFunctionAttribute() { $this.RequiresElevation = $false; $this.Source = "Microsoft.PowerShell.Crescendo" }
    PowerShellCustomFunctionAttribute([bool]$rElevation) {
        $this.RequiresElevation = $rElevation
        $this.Source = "Microsoft.PowerShell.Crescendo"
    }
}

# Returns available errors
# Assumes that we are being called from within a script cmdlet when EmitAsError is used.
function Pop-CrescendoNativeError {
param ([switch]$EmitAsError)
    while ($__CrescendoNativeErrorQueue.Count -gt 0) {
        if ($EmitAsError) {
            $msg = $__CrescendoNativeErrorQueue.Dequeue()
            $er = [System.Management.Automation.ErrorRecord]::new([system.invalidoperationexception]::new($msg), $PSCmdlet.Name, "InvalidOperation", $msg)
            $PSCmdlet.WriteError($er)
        }
        else {
            $__CrescendoNativeErrorQueue.Dequeue()
        }
    }
}
# this is purposefully a filter rather than a function for streaming errors
filter Push-CrescendoNativeError {
    if ($_ -is [System.Management.Automation.ErrorRecord]) {
        $__CrescendoNativeErrorQueue.Enqueue($_)
    }
    else {
        $_
    }
}

function Invoke-Prettier
{
[PowerShellCustomFunctionAttribute(RequiresElevation=$False)]
[CmdletBinding()]

param(
[Parameter(Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
[string]$Path,
[Parameter()]
[switch]$Write,
[Parameter()]
[switch]$Check,
[Parameter()]
[string]$Config,
[Parameter()]
[string]$IgnorePath,
[Parameter()]
[string]$LogLevel,
[Parameter()]
[string]$Parser,
[Parameter()]
[string]$Plugin,
[Parameter()]
[int]$TabWidth,
[Parameter()]
[switch]$UseTabs,
[Parameter()]
[switch]$SingleQuote,
[Parameter()]
[switch]$Semi,
[Parameter()]
[int]$PrintWidth,
[Parameter()]
[switch]$Stdin
    )

BEGIN {
    $PSNativeCommandUseErrorActionPreference = $false
    $__CrescendoNativeErrorQueue = [System.Collections.Queue]::new()
    $__PARAMETERMAP = @{
         Path = @{
               OriginalName = ''
               OriginalPosition = '0'
               Position = '0'
               ParameterType = 'string'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         Write = @{
               OriginalName = '--write'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'switch'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         Check = @{
               OriginalName = '--check'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'switch'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         Config = @{
               OriginalName = '--config'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'string'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         IgnorePath = @{
               OriginalName = '--ignore-path'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'string'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         LogLevel = @{
               OriginalName = '--loglevel'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'string'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '[string[]]@(''error'',''warn'',''info'',''debug'')'
               ArgumentTransformType = 'inline'
               }
         Parser = @{
               OriginalName = '--parser'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'string'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '[string[]]@(''babel'',''typescript'',''json'',''json5'',''css'',''scss'',''less'',''html'',''vue'',''yaml'',''markdown'',''graphql'',''mdx'',''handlebars'',''angular'',''lwc'')'
               ArgumentTransformType = 'inline'
               }
         Plugin = @{
               OriginalName = '--plugin'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'string'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '[string[]]@(''@prettier/plugin-xml'',''prettier-plugin-tailwindcss'',''prettier-plugin-organize-imports'')'
               ArgumentTransformType = 'inline'
               }
         TabWidth = @{
               OriginalName = '--tab-width'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'int'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         UseTabs = @{
               OriginalName = '--use-tabs'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'switch'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         SingleQuote = @{
               OriginalName = '--single-quote'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'switch'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         Semi = @{
               OriginalName = '--no-semi'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'switch'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         PrintWidth = @{
               OriginalName = '--print-width'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'int'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
         Stdin = @{
               OriginalName = '--stdin'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'switch'
               ApplyToExecutable = $False
               NoGap = $False
               ArgumentTransform = '$args'
               ArgumentTransformType = 'inline'
               }
    }

    $__outputHandlers = @{
        Default = @{ StreamOutput = $False; Handler = { Write-Output $args[0] } }
    }
}

PROCESS {
    $__boundParameters = $PSBoundParameters
    $__defaultValueParameters = $PSCmdlet.MyInvocation.MyCommand.Parameters.Values.Where({$_.Attributes.Where({$_.TypeId.Name -eq "PSDefaultValueAttribute"})}).Name
    $__defaultValueParameters.Where({ !$__boundParameters["$_"] }).ForEach({$__boundParameters["$_"] = get-variable -value $_})
    $__commandArgs = @()
    $MyInvocation.MyCommand.Parameters.Values.Where({$_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $__boundParameters[$_.Name]}).ForEach({$__boundParameters[$_.Name] = [switch]::new($false)})
    if ($__boundParameters["Debug"]){wait-debugger}
    foreach ($paramName in $__boundParameters.Keys|
            Where-Object {!$__PARAMETERMAP[$_].ApplyToExecutable}|
            Where-Object {!$__PARAMETERMAP[$_].ExcludeAsArgument}|
            Sort-Object {$__PARAMETERMAP[$_].OriginalPosition}) {
        $value = $__boundParameters[$paramName]
        $param = $__PARAMETERMAP[$paramName]
        if ($param) {
            if ($value -is [switch]) {
                 if ($value.IsPresent) {
                     if ($param.OriginalName) { $__commandArgs += $param.OriginalName }
                 }
                 elseif ($param.DefaultMissingValue) { $__commandArgs += $param.DefaultMissingValue }
            }
            elseif ( $param.NoGap ) {
                # if a transform is specified, use it and the construction of the values is up to the transform
                if($param.ArgumentTransform -ne '$args') {
                    $transform = $param.ArgumentTransform
                    if($param.ArgumentTransformType -eq 'inline') {
                        $transform = [scriptblock]::Create($param.ArgumentTransform)
                    }
                    $__commandArgs += & $transform $value
                }
                else {
                    $pFmt = "{0}{1}"
                    # quote the strings if they have spaces
                    if($value -match "\s") { $pFmt = "{0}""{1}""" }
                    $__commandArgs += $pFmt -f $param.OriginalName, $value
                }
            }
            else {
                if($param.OriginalName) { $__commandArgs += $param.OriginalName }
                if($param.ArgumentTransformType -eq 'inline') {
                   $transform = [scriptblock]::Create($param.ArgumentTransform)
                }
                else {
                   $transform = $param.ArgumentTransform
                }
                $__commandArgs += & $transform $value
            }
        }
    }
    $__commandArgs = $__commandArgs | Where-Object {$_ -ne $null}
    if ($__boundParameters["Debug"]){wait-debugger}
    if ( $__boundParameters["Verbose"]) {
         Write-Verbose -Verbose -Message "prettier"
         $__commandArgs | Write-Verbose -Verbose
    }
    $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
    if (! $__handlerInfo ) {
        $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
    }
    $__handler = $__handlerInfo.Handler
    if ( $PSCmdlet.ShouldProcess("prettier $__commandArgs")) {
    # check for the application and throw if it cannot be found
        if ( -not (Get-Command -ErrorAction Ignore "prettier")) {
          throw "Cannot find executable 'prettier'"
        }
        if ( $__handlerInfo.StreamOutput ) {
            if ( $null -eq $__handler ) {
                & "prettier" $__commandArgs
            }
            else {
                & "prettier" $__commandArgs 2>&1| Push-CrescendoNativeError | & $__handler
            }
        }
        else {
            $result = & "prettier" $__commandArgs 2>&1| Push-CrescendoNativeError
            & $__handler $result
        }
    }
    # be sure to let the user know if there are any errors
    Pop-CrescendoNativeError -EmitAsError
  } # end PROCESS

<#


.DESCRIPTION
Format files using Prettier

.PARAMETER Path
File(s) or directory to format


.PARAMETER Write
Edit files in-place


.PARAMETER Check
Check if files are formatted


.PARAMETER Config
Path to a Prettier configuration file


.PARAMETER IgnorePath
Path to .prettierignore file


.PARAMETER LogLevel
Log level (error, warn, info, debug)


.PARAMETER Parser
Parser to use (babel, typescript, json, html, etc.)


.PARAMETER Plugin
Add a plugin (e.g., @prettier/plugin-xml)


.PARAMETER TabWidth
Number of spaces per indentation level


.PARAMETER UseTabs
Indent with tabs instead of spaces


.PARAMETER SingleQuote
Use single quotes instead of double quotes


.PARAMETER Semi
Do not print semicolons at the ends of statements


.PARAMETER PrintWidth
Line length that Prettier will wrap on


.PARAMETER Stdin
Read input from stdin



.EXAMPLE
PS> prettier

Formats the specified file in-place using Prettier.


#>
}


