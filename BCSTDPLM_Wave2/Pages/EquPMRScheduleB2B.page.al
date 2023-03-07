page 33000934 "Equ. PMR Schedule B2B"
{

    Caption = '_Equipment PMR Schedule';
    PageType = Card;
    SourceTable = "Equipment B2B";
    UsageCategory = Documents;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(FrequencyFilter; FrequencyFilterGVar)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Frequency.';
                    Caption = 'Frequency';
                }
            }
            group("Matrix Options")
            {
                Caption = 'Matrix Options';
                field(MATRIX_CaptionRange; MATRIX_CaptionRangeGVar)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Matrix Options.';
                    Caption = 'Column Set';
                    Editable = false;
                }
                field(PeriodType; PeriodTypeGVar)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Period type.';
                    Caption = 'View by';
                    OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period';

                    trigger OnValidate();
                    begin
                        MATRIX_GenerateColumnCaptions(SetWanted::Initial);
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup1)
            {
                action("Next Set")
                {
                    Caption = 'Next Set';
                    PromotedOnly = true;
                    ApplicationArea = all;
                    Image = NextSet;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Next Set';

                    trigger OnAction();
                    var
                        MATRIX_Step: Option Initial,Previous,Same,Next;
                    begin
                        MATRIX_GenerateColumnCaptions(MATRIX_Step::Next);
                    end;
                }
                action("Previous Set")
                {
                    Caption = 'Previous Set';
                    ApplicationArea = all;
                    Image = PreviousSet;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Previous Set';

                    trigger OnAction();
                    var
                        MATRIX_Step: Option Initial,Previous,Same,Next;
                    begin
                        MATRIX_GenerateColumnCaptions(MATRIX_Step::Previous);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Clear(MATRIX_UseNameForCaption);
    end;

    var
        MATRIX_MatrixRecords: array[32] of Record Date;
        MatrixMgt: Codeunit "Matrix Management";
        MATRIX_CaptionSet: array[32] of Text[1024];

        MATRIX_PrimKeyFirstCaptionInCu: Text;
        MATRIX_UseNameForCaption: Boolean;
        MATRIX_DateFilter: Text[1024];
        MATRIX_CurrentSetLenght: Integer;
        MATRIX_CaptionRangeGVar: Text;
        PeriodTypeGVar: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        SetWanted: Option Initial,Previus,Same,Next;
        FrequencyFilterGVar: Code[10];

    procedure MATRIX_GenerateColumnCaptions(SetWanted: Option Initial,Previus,Same,Next);
    begin
        MatrixMgt.GeneratePeriodMatrixData(SetWanted, ARRAYLEN(MATRIX_CaptionSet), MATRIX_UseNameForCaption, PeriodTypeGVar, MATRIX_DateFilter,
           MATRIX_PrimKeyFirstCaptionInCu, MATRIX_CaptionSet, MATRIX_CaptionRangeGVar, MATRIX_CurrentSetLenght, MATRIX_MatrixRecords);
    end;
}

