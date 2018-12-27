param(
    [string]$Name
)

md $Name
cd $Name

# Create Solution
dotnet new sln -o $Name
$SlnFolder = $Name+"/"+$Name+".sln";

$UILayer = "4-UI";
$InfraLayer = "3-Infrastructure";
$ServiceLayer = "2-Service";
$DomainLayer = "1-Domain";

# Set Variables for Project Names
$UI = $Name+".UI.WebApi";
$InfraData = $Name+".Infrastructure.Data";
$ServiceAbstract = $Name+".Service.Abstract";
$ServiceService = $Name+".Service.Service";
$DomainObject = $Name+".Domain.Objects";
$DomainAbstract = $Name+".Domain.Abstract";

$UITest = $Name+".UI.WebApi.Test";
$InfraDataTest = $Name+".Infrastructure.Data.Test";
$ServiceServiceTest = $Name+".Service.Service.Test";
$DomainTest = $Name+".Domain.Test";

# Set Variables for folders
$UIFolder=$UILayer+"/"+$UI+"/"+$UI+".csproj";
$InfraDataFolder=$InfraLayer+"/"+$InfraData+"/"+$InfraData+".csproj";
$ServiceAbstractFolder=$ServiceLayer+"/"+$ServiceAbstract+"/"+$ServiceAbstract+".csproj";
$ServiceServiceFolder=$ServiceLayer+"/"+$ServiceService+"/"+$ServiceService+".csproj";
$DomainObjectFolder=$DomainLayer+"/"+$DomainObject+"/"+$DomainObject+".csproj";
$DomainAbstractFolder=$DomainLayer+"/"+$DomainAbstract+"/"+$DomainAbstract+".csproj";


$UITestFolder=$UILayer+"/"+$UITest+"/"+$UITest+".csproj";
$InfraDataTestFolder=$InfraLayer+"/"+$InfraDataTest+"/"+$InfraDataTest+".csproj";
$ServiceServiceTestFolder=$ServiceLayer+"/"+$ServiceServiceTest+"/"+$ServiceServiceTest+".csproj";
$DomainTestFolder=$DomainLayer+"/"+$DomainTest+"/"+$DomainTest+".csproj";

# Create project files

md $UILayer
md $InfraLayer
md $ServiceLayer
md $DomainLayer

cd $UILayer
dotnet new webapi -o $UI
dotnet new mstest -o $UITest
cd $UI
md ViewModels
cd ..
cd ..
cd $InfraLayer
dotnet new classlib -o $InfraData
dotnet new mstest -o $InfraDataTest
cd..
cd $ServiceLayer
dotnet new classlib -o $ServiceAbstract
dotnet new classlib -o $ServiceService
dotnet new mstest -o $ServiceServiceTest
cd..
cd $DomainLayer
dotnet new classlib -o $DomainObject
dotnet new classlib -o $DomainAbstract
dotnet new mstest -o $DomainTest
cd..
# Add project references to solution
dotnet sln $SlnFolder add $UIFolder
dotnet sln $SlnFolder add $InfraDataFolder
dotnet sln $SlnFolder add $ServiceAbstractFolder
dotnet sln $SlnFolder add $ServiceServiceFolder
dotnet sln $SlnFolder add $DomainObjectFolder
dotnet sln $SlnFolder add $DomainAbstractFolder

dotnet sln $SlnFolder add $UITestFolder
dotnet sln $SlnFolder add $InfraDataTestFolder
dotnet sln $SlnFolder add $ServiceServiceTestFolder
dotnet sln $SlnFolder add $DomainTestFolder

# Add project references to other projects
# # Application Projects
dotnet add $UIFolder reference $ServiceAbstractFolder
dotnet add $UIFolder reference $DomainObjectFolder
dotnet add $UIFolder reference $DomainAbstractFolder

dotnet add $InfraDataFolder reference $ServiceAbstractFolder
dotnet add $InfraDataFolder reference $DomainObjectFolder
dotnet add $InfraDataFolder reference $DomainAbstractFolder

dotnet add $ServiceAbstractFolder reference $DomainObjectFolder
dotnet add $ServiceAbstractFolder reference $DomainAbstractFolder

dotnet add $ServiceServiceFolder reference $ServiceAbstractFolder
dotnet add $ServiceServiceFolder reference $DomainObjectFolder
dotnet add $ServiceServiceFolder reference $DomainAbstractFolder

dotnet add $DomainAbstractFolder reference $DomainObjectFolder

# # Testing Projects
dotnet add $UITestFolder reference $UIFolder
dotnet add $UITestFolder reference $ServiceAbstractFolder
dotnet add $UITestFolder reference $DomainObjectFolder
dotnet add $UITestFolder reference $DomainAbstractFolder
dotnet add $UITestFolder reference $DomainTestFolder

dotnet add $InfraDataTestFolder reference $InfraDataFolder
dotnet add $InfraDataTestFolder reference $ServiceAbstractFolder
dotnet add $InfraDataTestFolder reference $DomainObjectFolder
dotnet add $InfraDataTestFolder reference $DomainAbstractFolder
dotnet add $InfraDataTestFolder reference $DomainTestFolder

dotnet add $ServiceServiceTestFolder reference $ServiceServiceFolder
dotnet add $ServiceServiceTestFolder reference $ServiceAbstractFolder
dotnet add $ServiceServiceTestFolder reference $DomainObjectFolder
dotnet add $ServiceServiceTestFolder reference $DomainAbstractFolder
dotnet add $ServiceServiceTestFolder reference $DomainTestFolder

dotnet add $DomainTestFolder reference $DomainObjectFolder
dotnet add $DomainTestFolder reference $DomainAbstractFolder

cd ..