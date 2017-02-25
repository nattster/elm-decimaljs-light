module Decimal exposing (..)

import Native.DecimalLight


type Decimal
    = Decimal


type Rounding
    = RoundUp
    | RoundDown
    | RoundCeil
    | RoundFloor
    | RoundHalfUp
    | RoundHalfDown
    | RoundHalfEven
    | RoundHalfCeil
    | RoundHalfFloor


fromInt : Int -> Decimal
fromInt =
    Native.DecimalLight.fromInt


fromString : String -> Decimal
fromString =
    Native.DecimalLight.fromString


toString : Decimal -> String
toString =
    Native.DecimalLight.toString


absoluteValue : Decimal -> Decimal
absoluteValue =
    Native.DecimalLight.absoluteValue


comparedTo : Decimal -> Decimal -> Int
comparedTo =
    Native.DecimalLight.comparedTo


decimalPlaces : Decimal -> Int
decimalPlaces =
    Native.DecimalLight.decimalPlaces


dividedBy : Decimal -> Decimal -> Decimal
dividedBy =
    Native.DecimalLight.dividedBy


dividedToIntegerBy : Decimal -> Decimal -> Decimal
dividedToIntegerBy =
    Native.DecimalLight.dividedToIntegerBy


equals : Decimal -> Decimal -> Bool
equals =
    Native.DecimalLight.equals


exponent : Decimal -> Int
exponent =
    Native.DecimalLight.exponent


greaterThan : Decimal -> Decimal -> Bool
greaterThan =
    Native.DecimalLight.greaterThan


greaterThanOrEqualTo : Decimal -> Decimal -> Bool
greaterThanOrEqualTo =
    Native.DecimalLight.greaterThanOrEqualTo


isInteger : Decimal -> Bool
isInteger =
    Native.DecimalLight.isInteger


isNegative : Decimal -> Bool
isNegative =
    Native.DecimalLight.isNegative


isPositive : Decimal -> Bool
isPositive =
    Native.DecimalLight.isPositive


isZero : Decimal -> Bool
isZero =
    Native.DecimalLight.isZero


lessThan : Decimal -> Decimal -> Bool
lessThan =
    Native.DecimalLight.lessThan


lessThanOrEqualTo : Decimal -> Decimal -> Bool
lessThanOrEqualTo =
    Native.DecimalLight.lessThanOrEqualTo


logarithm : Decimal -> Decimal -> Decimal
logarithm value base =
    Native.DecimalLight.logarithm value base


minus : Decimal -> Decimal -> Decimal
minus =
    Native.DecimalLight.minus


modulo : Decimal -> Decimal -> Decimal
modulo =
    Native.DecimalLight.modulo


naturalExponential : Decimal -> Decimal
naturalExponential =
    Native.DecimalLight.naturalExponential


naturalLogarithm : Decimal -> Decimal
naturalLogarithm =
    Native.DecimalLight.naturalLogarithm


negated : Decimal -> Decimal
negated =
    Native.DecimalLight.negated


plus : Decimal -> Decimal -> Decimal
plus =
    Native.DecimalLight.plus


precision : Decimal -> Int
precision =
    Native.DecimalLight.precision


squareRoot : Decimal -> Decimal
squareRoot =
    Native.DecimalLight.squareRoot


times : Decimal -> Decimal -> Decimal
times =
    Native.DecimalLight.times


toDecimalPlaces : Decimal -> Int -> Decimal
toDecimalPlaces value places =
    Native.DecimalLight.toDecimalPlaces value places


roundToDecimalPlaces : Decimal -> Int -> Rounding -> Decimal
roundToDecimalPlaces value places rounding =
    case rounding of
        RoundUp ->
            Native.DecimalLight.roundToDecimalPlaces value places Native.DecimalLight.ROUND_UP

        RoundDown ->
            Native.DecimalLight.roundToDecimalPlaces value places Native.DecimalLight.ROUND_DOWN

        RoundCeil ->
            Native.DecimalLight.roundToDecimalPlaces value places Native.DecimalLight.ROUND_CEIL

        RoundFloor ->
            Native.DecimalLight.roundToDecimalPlaces value places Native.DecimalLight.ROUND_FLOOR

        RoundHalfUp ->
            Native.DecimalLight.roundToDecimalPlaces value places Native.DecimalLight.ROUND_HALF_UP

        RoundHalfDown ->
            Native.DecimalLight.roundToDecimalPlaces value places Native.DecimalLight.ROUND_HALF_DOWN

        RoundHalfEven ->
            Native.DecimalLight.roundToDecimalPlaces value places Native.DecimalLight.ROUND_HALF_EVEN

        RoundHalfCeil ->
            Native.DecimalLight.roundToDecimalPlaces value places Native.DecimalLight.ROUND_HALF_CEIL

        RoundHalfFloor ->
            Native.DecimalLight.roundToDecimalPlaces value places Native.DecimalLight.ROUND_HALF_FLOOR
