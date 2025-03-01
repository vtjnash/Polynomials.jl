module Polynomials

#  using GenericLinearAlgebra ## remove for now. cf: https://github.com/JuliaLinearAlgebra/GenericLinearAlgebra.jl/pull/71#issuecomment-743928205
using LinearAlgebra
import Base: evalpoly
using Setfield

include("abstract.jl")
include("show.jl")
include("plots.jl")
include("contrib.jl")

# Interface for all AbstractPolynomials
include("common.jl")

# polynomials with explicit basis
include("abstract-polynomial.jl")
include("polynomial-container-types/mutable-dense-polynomial.jl")
include("polynomial-container-types/mutable-dense-view-polynomial.jl")
include("polynomial-container-types/mutable-dense-laurent-polynomial.jl")
include("polynomial-container-types/immutable-dense-polynomial.jl")
include("polynomial-container-types/mutable-sparse-polynomial.jl")
const PolynomialContainerTypes = (:MutableDensePolynomial, :MutableDenseViewPolynomial, :ImmutableDensePolynomial,
                                  :MutableDenseLaurentPolynomial, :MutableSparsePolynomial) # useful for some purposes
const ZeroBasedDensePolynomialContainerTypes = (:MutableDensePolynomial, :MutableDenseViewPolynomial, :ImmutableDensePolynomial)

include("polynomials/standard-basis/standard-basis.jl")
include("polynomials/standard-basis/polynomial.jl")
include("polynomials/standard-basis/pn-polynomial.jl")
include("polynomials/standard-basis/laurent-polynomial.jl")
include("polynomials/standard-basis/immutable-polynomial.jl")
include("polynomials/standard-basis/sparse-polynomial.jl")

include("polynomials/ngcd.jl")
include("polynomials/multroot.jl")

include("polynomials/factored_polynomial.jl")
include("polynomials/chebyshev.jl")

include("promotions.jl")



# Rational functions
include("rational-functions/common.jl")
include("rational-functions/rational-function.jl")
include("rational-functions/fit.jl")
#include("rational-functions/rational-transfer-function.jl")
include("rational-functions/plot-recipes.jl")

# compat; opt-in with `using Polynomials.PolyCompat`
include("legacy/misc.jl")
include("legacy/Poly.jl")

if !isdefined(Base, :get_extension)
    include("../ext/PolynomialsChainRulesCoreExt.jl")
    include("../ext/PolynomialsMakieCoreExt.jl")
    include("../ext/PolynomialsMutableArithmeticsExt.jl")
end

include("precompiles.jl")

end # module
