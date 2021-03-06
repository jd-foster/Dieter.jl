module Dieter

# %%
# using Reexport
using DataFrames
using DataFramesMeta
using CSV
using SQLite
# using Tables
# @reexport using DataFrames, CSV

# using Feather
# using Arrow  # review whether Arrow needs to be a dependency
# # using Missings

using JuMP
# import MathOptInterface
# const MOI = MathOptInterface
# @reexport using JuMP
using ProgressMeter
# using Plots
# @reexport using Plots
# using ColorSchemes
# @reexport using ColorSchemes

# %% Fundamental structures
include("util.jl")
include("struct.jl")
include("base.jl")

# include("spacetime.jl")

# %% Model components
include("ev.jl")
include("heat.jl")
include("p2g.jl")

# %%
const hoursInYear = 8760     # Units: hours/yr
const H2_energy_density = 39405.6 # Units : MWh / kg
const infeas_cost = 1000     # Currency (cost)

include("model.jl")


# %%
export DieterModel,
InitialiseDieterModel,
create_relation,
initialise_data_file_dict!,
check_files_exist,
parse_data_to_model!,
build_model!,
solve_model!,
generate_results!

# The following code is taken from PowerModels.jl:
# the follow items are also exported for user-friendliness when calling
# `using Dieter`
# so that users do not need to import JuMP to use a solver via `with_optimizer`
import JuMP: with_optimizer
export with_optimizer

# import MathOptInterface: TerminationStatusCode
import JuMP.MOI: TerminationStatusCode
export TerminationStatusCode

# import MathOptInterface: ResultStatusCode
import JuMP.MOI: ResultStatusCode
export ResultStatusCode

for status_code_enum in [TerminationStatusCode, ResultStatusCode]
    for status_code in instances(status_code_enum)
        @eval import MathOptInterface: $(Symbol(status_code))
        @eval export $(Symbol(status_code))
    end
end

end # module Dieter
