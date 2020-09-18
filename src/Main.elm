module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)

view : Model -> Html Msg
view model =
    
    div []
        [ h1 [] [ text "BMI計算機" ]
        , p [] [ text "身長と体重から肥満度の指標となるBMIを計算します。" ]
        , img [ src "https://2.bp.blogspot.com/-EKr90P4ykhg/XDXbxaz8HkI/AAAAAAABRD4/D5ViWm5G1Dw6JxI0njeuvu6YOoWPz_IpQCLcBGAs/s800/kenkoushindan_taijuu_digital_boy.png" 
              , alt "体重測定"
              , width 200
              , height 220
              ]
            [  ]
        , p [] 
            [ text "身長" 
            ,input [ type_ "number" 
                    ,name "name"
                    , (onInput (\input -> String.toFloat input |>  UpdateHeight))
                    , value (model.height |> Maybe.map String.fromFloat |> Maybe.withDefault "" ) ] []
            , text "cm"
            , br [] []
            , text "体重"
            ,input [ type_ "number" 
                   ,name "name"
                   , (onInput (\input -> String.toFloat input |>  UpdateWeight))
                   , value (model.weight |> Maybe.map String.fromFloat |> Maybe.withDefault "" ) ] []             
            , text "kg"
            ]
        , button  [ onClick CalculateBmi ] [ text "計算"]
        , text "結果"
        , text (String.fromFloat (model.bmi |> Maybe.withDefault -1))
        ]
        
calculateBmi : Weight -> Height -> Bmi
calculateBmi weight height = 
    let
        mHeight = height / 100.0
    in
    weight / (mHeight * mHeight)
    
type alias Weight = Float
type alias Height = Float
type alias Bmi = Float
        
-- Modelの型定義
type alias Model =
    { weight : Maybe Weight
    , height : Maybe Height
    , bmi : Maybe Bmi
    }
    
-- init関数
init = { weight = Nothing , height = Nothing, bmi = Nothing }
-- update関数

type Msg
    = CalculateBmi
    | UpdateHeight (Maybe Height)
    | UpdateWeight (Maybe Weight)
    
update : Msg -> Model -> Model
update msg model =
    case msg of
       UpdateHeight height -> { model | height = height }
       UpdateWeight weight -> { model | weight = weight }
       CalculateBmi -> case (model.weight, model.height) of
                           (Just weight, Just height) -> { model | bmi = calculateBmi weight height |> Just }
                           _ -> { model | bmi = Nothing }

main = Browser.sandbox { view = view, init = init, update = update }