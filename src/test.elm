module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Decimal


main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    Decimal.Decimal


model : Model
model =
    dstr "0"



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model



-- VIEW


ten =
    Decimal.fromInt 10


minus_ten =
    Decimal.fromInt -10


type alias StringTestRecord =
    { test : String
    , actual : Decimal.Decimal
    , expected : String
    }


type alias BoolTestRecord =
    { test : String
    , actual : Bool
    , expected : Bool
    }


type alias IntTestRecord =
    { test : String
    , actual : Int
    , expected : Int
    }


type Test
    = StringTest StringTestRecord
    | BoolTest BoolTestRecord
    | IntTest IntTestRecord


dstr value =
    let
        result =
            Decimal.fromString value
    in
        case result of
            Just result_ ->
                result_

            Nothing ->
                Decimal.fromInt 0


tests : List Test
tests =
    [ StringTest
        { test = "fromString"
        , actual = dstr "1.0"
        , expected = "1"
        }
    , StringTest
        { test = "fromInt"
        , actual = Decimal.fromInt 10
        , expected = "10"
        }
    , StringTest
        { test = "absoluteValue 1"
        , actual = Decimal.absoluteValue ten
        , expected = "10"
        }
    , StringTest
        { test = "absoluteValue 2"
        , actual = Decimal.absoluteValue minus_ten
        , expected = "10"
        }
    , IntTest
        { test = "comparedTo 0"
        , actual = Decimal.comparedTo (Decimal.fromInt 5) (Decimal.fromInt 5)
        , expected = 0
        }
    , IntTest
        { test = "comparedTo -1"
        , actual = Decimal.comparedTo (Decimal.fromInt 2) (Decimal.fromInt 5)
        , expected = -1
        }
    , IntTest
        { test = "comparedTo 1"
        , actual = Decimal.comparedTo (Decimal.fromInt 5) (Decimal.fromInt 2)
        , expected = 1
        }
    , IntTest
        { test = "DecimalPlaces"
        , actual = Decimal.decimalPlaces (dstr "1.234")
        , expected = 3
        }
    , IntTest
        { test = "DecimalPlaces 2"
        , actual = Decimal.decimalPlaces (dstr "1")
        , expected = 0
        }
    , StringTest
        { test = "dividedBy"
        , actual = Decimal.dividedBy (dstr "355") (dstr "113")
        , expected = "3.1415929203539823008"
        }
    , StringTest
        { test = "dividedToIntegerBy"
        , actual = Decimal.dividedToIntegerBy (dstr "355") (dstr "113")
        , expected = "3"
        }
    , BoolTest
        { test = "equals"
        , actual = Decimal.equals (dstr "10") ten
        , expected = True
        }
    , IntTest
        { test = "exponent"
        , actual = Decimal.exponent (dstr "1234.567890")
        , expected = 3
        }
    , BoolTest
        { test = "greaterThan"
        , actual = Decimal.greaterThan (dstr "10") (dstr "3")
        , expected = True
        }
    , BoolTest
        { test = "greaterThan 2"
        , actual = Decimal.greaterThan (dstr "3") (dstr "10")
        , expected = False
        }
    , BoolTest
        { test = "greaterThanOrEqualTo"
        , actual = Decimal.greaterThanOrEqualTo (dstr "10") (dstr "3")
        , expected = True
        }
    , BoolTest
        { test = "greaterThanOrEqualTo 2"
        , actual = Decimal.greaterThanOrEqualTo (dstr "10") (dstr "10")
        , expected = True
        }
    , BoolTest
        { test = "isInteger"
        , actual = Decimal.isInteger (dstr "10")
        , expected = True
        }
    , BoolTest
        { test = "isInteger 2"
        , actual = Decimal.isInteger (dstr "10.5")
        , expected = False
        }
    , BoolTest
        { test = "isNegative"
        , actual = Decimal.isNegative (dstr "-10")
        , expected = True
        }
    , BoolTest
        { test = "isNegative 2"
        , actual = Decimal.isNegative (dstr "10.5")
        , expected = False
        }
    , BoolTest
        { test = "isPositive"
        , actual = Decimal.isPositive (dstr "10.5")
        , expected = True
        }
    , BoolTest
        { test = "isPositive 2"
        , actual = Decimal.isPositive (dstr "-10")
        , expected = False
        }
    , BoolTest
        { test = "isZero"
        , actual = Decimal.isZero (dstr "0.0")
        , expected = True
        }
    , BoolTest
        { test = "isZero 2"
        , actual = Decimal.isZero (dstr "1")
        , expected = False
        }
    , BoolTest
        { test = "lessThan"
        , actual = Decimal.lessThan (dstr "0.0") (dstr "5")
        , expected = True
        }
    , BoolTest
        { test = "lessThan 2"
        , actual = Decimal.lessThan ten (dstr "1")
        , expected = False
        }
    , BoolTest
        { test = "lessThanOrEqualTo"
        , actual = Decimal.lessThanOrEqualTo (dstr "0.0") (dstr "5")
        , expected = True
        }
    , BoolTest
        { test = "lessThanOrEqualTo 2"
        , actual = Decimal.lessThanOrEqualTo ten (dstr "10")
        , expected = True
        }
    , StringTest
        { test = "logarithm"
        , actual = Decimal.logarithm (dstr "256") (dstr "2")
        , expected = "8"
        }
    , StringTest
        { test = "minus"
        , actual = Decimal.minus (dstr "256") (dstr "2")
        , expected = "254"
        }
    , StringTest
        { test = "modulo"
        , actual = Decimal.modulo (dstr "256") (dstr "2")
        , expected = "0"
        }
    , StringTest
        { test = "naturalExponential"
        , actual = Decimal.naturalExponential (dstr "1")
        , expected = "2.7182818284590452353"
        }
    , StringTest
        { test = "naturalLogarithm"
        , actual = Decimal.naturalLogarithm (dstr "10")
        , expected = "2.302585092994045684"
        }
    , StringTest
        { test = "negated"
        , actual = Decimal.negated (dstr "10")
        , expected = "-10"
        }
    , StringTest
        { test = "plus"
        , actual = Decimal.plus (dstr "10") (dstr "5")
        , expected = "15"
        }
    , IntTest
        { test = "precision"
        , actual = Decimal.precision (dstr "10.5413")
        , expected = 6
        }
    , StringTest
        { test = "squareRoot"
        , actual = Decimal.squareRoot (dstr "16")
        , expected = "4"
        }
    , StringTest
        { test = "times"
        , actual = Decimal.times (dstr "21.4") (dstr "0.9")
        , expected = "19.26"
        }
    , StringTest
        { test = "toDecimalPlaces"
        , actual = Decimal.toDecimalPlaces (dstr "21.4551234") 2
        , expected = "21.46"
        }
    , StringTest
        { test = "roundToDecimalPlaces"
        , actual = Decimal.roundToDecimalPlaces (dstr "21.4551234") 2 Decimal.RoundDown
        , expected = "21.45"
        }
    ]


runStringTest { test, actual, expected } =
    let
        actualStr =
            Decimal.toString actual
    in
        if actualStr == expected then
            test ++ ": passed"
        else
            test ++ ": failed [actual = " ++ actualStr ++ ", expected = " ++ expected ++ "]"


runBoolTest { test, actual, expected } =
    if actual == expected then
        test ++ ": passed"
    else
        test ++ ": failed [actual = " ++ (toString actual) ++ ", expected = " ++ (toString expected) ++ "]"


runTest test_ =
    case test_ of
        StringTest test ->
            runStringTest test

        BoolTest test ->
            runBoolTest test

        IntTest test ->
            runBoolTest test


renderTest test =
    let
        result =
            runTest test
    in
        div []
            [ text result
            ]


view : Model -> Html Msg
view model =
    div []
        (List.map
            renderTest
            tests
        )
