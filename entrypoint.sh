MY=(
    [ROLE]=app
    [RUN_AS]=root
    [JULIA_PACKAGES]="${JULIA_PACKAGES:-}" # space separated. e.g. "TimeSeries MarketData Convex"
)

export PATH=/usr/local/julia/bin:$PATH

passthrough_unless "julia" "$@"
if [ -z $JULIA_PACKAGES ]
then
    echo "no packages specified"
else
    	julia -e 'using Pkg; packagesVariable=ENV["JULIA_PACKAGES"]; packages = split(packagesVariable); for package in packages; Pkg.add(package); end'
fi
    

run "$@"
