# Read REQUIRE and install packages
using Pkg
list = readlines("REQUIRE")
install_list = String[]

for pkg in list[2:end]
	if pkg == "Weave"
		Pkg.add(PackageSpec(name=pkg, version="0.9.4"))
	elseif !isempty(pkg)
		push!(install_list, pkg)
	end
end
Pkg.add(install_list)
@info "Done!"