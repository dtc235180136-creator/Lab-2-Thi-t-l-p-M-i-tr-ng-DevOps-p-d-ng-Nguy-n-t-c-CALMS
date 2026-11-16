$ErrorActionPreference = 'SilentlyContinue'

Write-Host '=== DEVOPS TOOLCHAIN CHECK ==='
Write-Host ''

function Test-Tool($name, $command, $arguments) {
	$tool = Get-Command $command
	if ($null -eq $tool) {
		Write-Host ('{0,-12} NOT INSTALLED' -f ($name + ':'))
		return $false
	}

	$version = & $command $arguments 2>$null | Select-Object -First 1
	Write-Host ('{0,-12} {1}' -f ($name + ':'), $version)
	return $true
}

$gitOk = Test-Tool 'Git' 'git' '--version'
$dockerOk = Test-Tool 'Docker' 'docker' '--version'
$nodeOk = Test-Tool 'Node.js' 'node' '--version'
$codeOk = Test-Tool 'VS Code' 'code' '--version'

Write-Host ''
Write-Host 'Required tools: Git, Docker and VS Code'
Write-Host ('Status: Git={0}; Docker={1}; VS Code={2}' -f $gitOk, $dockerOk, $codeOk)
Write-Host 'Node.js is used by the demo application and is optional on the host when Docker is available.'
