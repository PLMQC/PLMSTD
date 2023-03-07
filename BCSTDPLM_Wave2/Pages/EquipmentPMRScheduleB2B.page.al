page 33000928 "Equipment PMR Schedule B2B"
{
    Caption = 'Work Center Calendar';
    DataCaptionExpression = '';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = Card;
    SaveValues = true;
    SourceTable = "Equipment B2B";
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group("Matrix Options")
            {
                Caption = 'Matrix Options';
                field(FrequencyFilter; FrequencyFilterVar)
                {
                    Caption = 'Frequency Filter';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Frequency filter.';

                    trigger OnLookup(Var Text: Text): Boolean;
                    begin
                        if PAGE.RUNMODAL(0, FrequencyGRec) = ACTION::LookupOK then
                            FrequencyFilterVar := FrequencyGRec.Code;
                    end;

                    trigger OnValidate();
                    begin
                        MATRIX_GenerateColumnCaptions(SetWanted::Same);
                    end;
                }
                field(PeriodType; PeriodTypeVar)
                {
                    Caption = 'View by';
                    ApplicationArea = all;
                    ToolTip = 'It Defines View By.';
                    OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period';

                    trigger OnValidate();
                    begin
                        MATRIX_GenerateColumnCaptions(SetWanted::Initial);
                    end;
                }
                field(MATRIX_CaptionRange; MATRIX_CaptionRangeGVar)
                {
                    Caption = 'Column Set';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Column Set.';
                    Editable = false;
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
                    PromotedIsBig = true;
                    ToolTip = 'Next Set';

                    trigger OnAction();
                    begin
                        MATRIX_GenerateColumnCaptions(SetWanted::Next);
                    end;
                }
                action("&Show Matrix")
                {
                    Caption = '&Show Matrix';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Function Show Matrix ';
                    Image = ShowMatrix;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        MatrixForm: Page "Equipment Schedule Matrix B2B";
                    begin
                        CLEAR(MatrixForm);
                        Clear(MATRIX_CurrentNoOfColumns);
                        MatrixForm.Load(MATRIX_CaptionSet, MATRIX_MatrixRecords, MATRIX_CurrentNoOfColumns, FrequencyFilterVar);
                        MatrixForm.SETTABLEVIEW(Rec);
                        MatrixForm.RUNMODAL();
                    end;
                }
                action("Previous Set")
                {
                    Caption = 'Previous Set';
                    ApplicationArea = all;
                    Image = PreviousSet;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Previous Set';

                    trigger OnAction();
                    begin
                        MATRIX_GenerateColumnCaptions(SetWanted::Previus);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        MATRIX_GenerateColumnCaptions(SetWanted::Initial);
        MATRIX_UseNameForCaption := false;
        MATRIX_CurrentSetLenght := ARRAYLEN(MATRIX_CaptionSet);
    end;

    var
        MATRIX_MatrixRecords: array[32] of Record Date;
        FrequencyGRec: Record "Frequency  B2B";
        MatrixMgt: Codeunit "Matrix Management";
        MATRIX_CaptionSet: array[32] of Text[1024];
        MATRIX_CaptionRangeGVar: Text;
        MATRIX_PrimKeyFirstCaptionInCu: Text;
        MATRIX_CurrentNoOfColumns: Integer;
        MATRIX_UseNameForCaption: Boolean;
        MATRIX_DateFilter: Text[1024];
        MATRIX_CurrentSetLenght: Integer;
        PeriodTypeVar: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        SetWanted: Option Initial,Previus,Same,Next;
        FrequencyFilterVar: Code[20];


    procedure MATRIX_GenerateColumnCaptions(SetWanted: Option Initial,Previus,Same,Next);
    begin
        MatrixMgt.GeneratePeriodMatrixData(SetWanted, ARRAYLEN(MATRIX_CaptionSet), MATRIX_UseNameForCaption, PeriodTypeVar, MATRIX_DateFilter,
                         MATRIX_PrimKeyFirstCaptionInCu, MATRIX_CaptionSet, MATRIX_CaptionRangeGVar, MATRIX_CurrentSetLenght, MATRIX_MatrixRecords);
    end;
}

