function New-UDGrid {
    param(
        [Parameter()]
        [string]$Id = ([Guid]::NewGuid()),
        [Parameter()]
		[string]$Title,
		[Parameter()]
		[string[]]$Headers,
		[Parameter()]
		[string[]]$Properties,
		[Parameter()]
		[string]$DefaultSortColumn,
		[Parameter()]
		[Switch]$DefaultSortDescending,
	    [Parameter()]
	    [UniversalDashboard.Models.DashboardColor]$BackgroundColor,
	    [Parameter()]
	    [UniversalDashboard.Models.DashboardColor]$FontColor,
	    [Parameter()]
	    [Hashtable[]]$Links,
		[Parameter()]
		[Switch]$ServerSideProcessing,
		[Parameter()]
	    [string]$DateTimeFormat = "lll",
		[Parameter()]
		[int]$PageSize = 10,
		[Parameter()]
		[Switch]$NoPaging,
		[Parameter()]
        [string]$FilterText = "Filter",
        [Parameter()]
        [Switch]$NoFilter,
        [Parameter(Mandatory)]
        [Endpoint]$Endpoint,
        [Parameter()]
        [object[]]$ArgumentList,
        [Parameter()]
	    [Switch]$AutoRefresh,
	    [Parameter()]
        [int]$RefreshInterval = 5,
        [Parameter()]
        [Switch]$NoExport 
    )

    End {

        $Endpoint.Register($Id, $PSCmdlet)

        @{
            type = 'ud-grid'
            isPlugin = $true 
            assetId = $AssetId

            id = $id
            title = $Title
            headers = $Headers 
            properties = $Properties 
            defaultSortColumn = $DefaultSortColumn
            defaultSortDescending = $DefaultSortDescending.IsPresent
            backgroundColor = $BackgroundColor.HtmlColor
            fontColor = $FontColor.HtmlColor
            links = $Links
            serverSideProcessing = $ServerSideProcessing.IsPresent
            dateTimeFormat = $DateTimeFormat
            pageSize = $PageSize
            noPaging = $NoPaging.IsPresent
            filterText = $FilterText
            noFilter = $NoFilter.IsPresent
            autoRefresh = $AutoRefresh.IsPresent
            refreshInterval = $RefreshInterval
            noExport = $NoExport.IsPresent
        }
    }
}