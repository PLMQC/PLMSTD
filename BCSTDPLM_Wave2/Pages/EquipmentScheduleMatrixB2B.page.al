page 33000935 "Equipment Schedule Matrix B2B"
{

    Caption = 'Work Center Calendar Matrix';
    DataCaptionExpression = '';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Equipment B2B";
    UsageCategory = Administration;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines No.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Name.';
                }
                field(Field1; MATRIX_CellData[1])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[1];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(1);
                    end;
                }
                field(Field2; MATRIX_CellData[2])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[2];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(2);
                    end;
                }
                field(Field3; MATRIX_CellData[3])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[3];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(3);
                    end;
                }
                field(Field4; MATRIX_CellData[4])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[4];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(4);
                    end;
                }
                field(Field5; MATRIX_CellData[5])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[5];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(5);
                    end;
                }
                field(Field6; MATRIX_CellData[6])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[6];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(6);
                    end;
                }
                field(Field7; MATRIX_CellData[7])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[7];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(7);
                    end;
                }
                field(Field8; MATRIX_CellData[8])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[8];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(8);
                    end;
                }
                field(Field9; MATRIX_CellData[9])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[9];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(9);
                    end;
                }
                field(Field10; MATRIX_CellData[10])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[10];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(10);
                    end;
                }
                field(Field11; MATRIX_CellData[11])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[11];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(11);
                    end;
                }
                field(Field12; MATRIX_CellData[12])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[12];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(12);
                    end;
                }
                field(Field13; MATRIX_CellData[13])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[13];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(13);
                    end;
                }
                field(Field14; MATRIX_CellData[14])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[14];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(14);
                    end;
                }
                field(Field15; MATRIX_CellData[15])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[15];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(15);
                    end;
                }
                field(Field16; MATRIX_CellData[16])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[16];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(16);
                    end;
                }
                field(Field17; MATRIX_CellData[17])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[17];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(17);
                    end;
                }
                field(Field18; MATRIX_CellData[18])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[18];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(18);
                    end;
                }
                field(Field19; MATRIX_CellData[19])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[19];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(19);
                    end;
                }
                field(Field20; MATRIX_CellData[20])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[20];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(20);
                    end;
                }
                field(Field21; MATRIX_CellData[21])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[21];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(21);
                    end;
                }
                field(Field22; MATRIX_CellData[22])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[22];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(22);
                    end;
                }
                field(Field23; MATRIX_CellData[23])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[23];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(23);
                    end;
                }
                field(Field24; MATRIX_CellData[24])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[24];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(24);
                    end;
                }
                field(Field25; MATRIX_CellData[25])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[25];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(25);
                    end;
                }
                field(Field26; MATRIX_CellData[26])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[26];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(26);
                    end;
                }
                field(Field27; MATRIX_CellData[27])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[27];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(27);
                    end;
                }
                field(Field28; MATRIX_CellData[28])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[28];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(28);
                    end;
                }
                field(Field29; MATRIX_CellData[29])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[29];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(29);
                    end;
                }
                field(Field30; MATRIX_CellData[30])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[30];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(30);
                    end;
                }
                field(Field31; MATRIX_CellData[31])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[31];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(31);
                    end;
                }
                field(Field32; MATRIX_CellData[32])
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Date.';
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[32];
                    DecimalPlaces = 0 : 2;

                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(32);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    var
        MATRIX_CurrentColumnOrdinal: Integer;
    begin
        MATRIX_CurrentColumnOrdinal := 0;
        while MATRIX_CurrentColumnOrdinal < MATRIX_CurrentNoOfMatrixColumn do begin
            MATRIX_CurrentColumnOrdinal := MATRIX_CurrentColumnOrdinal + 1;
            MATRIX_OnAfterGetRecord(MATRIX_CurrentColumnOrdinal);
        end;
    end;

    trigger OnOpenPage();
    begin
        MATRIX_CurrentNoOfMatrixColumn := ARRAYLEN(MATRIX_CellData);
    end;

    var
        MachinePMRSchedule: Record "Equipment PMR Schedule B2B";
        MatrixRecords: array[32] of Record Date;
        MATRIX_CurrentNoOfMatrixColumn: Integer;
        MATRIX_CellData: array[32] of Decimal;
        MATRIX_CaptionSet: array[32] of Text[1024];
        FreqG: Code[20];

    local procedure SetDateFilter(MATRIX_ColumnOrdinal: Integer);
    begin
        if MatrixRecords[MATRIX_ColumnOrdinal]."Period Start" = MatrixRecords[MATRIX_ColumnOrdinal]."Period End" then
            Rec.SETRANGE("Date Filter", MatrixRecords[MATRIX_ColumnOrdinal]."Period Start")
        else
            Rec.SETRANGE("Date Filter", MatrixRecords[MATRIX_ColumnOrdinal]."Period Start", MatrixRecords[MATRIX_ColumnOrdinal]."Period End")
    end;

    procedure Load(var MatrixColumns1: array[32] of Text[1024]; var MatrixRecords1: array[32] of Record Date; CurrentNoOfMatrixColumns: Integer; Freq: Code[20]);
    begin
        COPYARRAY(MATRIX_CaptionSet, MatrixColumns1, 1);
        COPYARRAY(MatrixRecords, MatrixRecords1, 1);
        MATRIX_CurrentNoOfMatrixColumn := CurrentNoOfMatrixColumns;
        FreqG := Freq;
    end;

    local procedure MATRIX_OnDrillDown(MATRIX_ColumnOrdinal: Integer);
    var
        PMRScheduleList: Page "Equi. PMR Schedule List B2B";
    begin
        MachinePMRSchedule.SETRANGE("Machine ID", Rec."No.");
        if MatrixRecords[MATRIX_ColumnOrdinal]."Period Start" = MatrixRecords[MATRIX_ColumnOrdinal]."Period End" then
            MachinePMRSchedule.SETRANGE(Date, MatrixRecords[MATRIX_ColumnOrdinal]."Period Start")
        else
            MachinePMRSchedule.SETRANGE(Date,
                  MatrixRecords[MATRIX_ColumnOrdinal]."Period Start", MatrixRecords[MATRIX_ColumnOrdinal]."Period End");
        if FreqG <> '' then
            MachinePMRSchedule.SETRANGE(Frequency, FreqG);
        PMRScheduleList.SETTABLEVIEW(MachinePMRSchedule);
        PMRScheduleList.RUNMODAL();
    end;

    local procedure MATRIX_OnAfterGetRecord(MATRIX_ColumnOrdinal: Integer);
    begin

        SetDateFilter(MATRIX_ColumnOrdinal);
        MachinePMRSchedule.SETRANGE("Machine ID", Rec."No.");
        if MatrixRecords[MATRIX_ColumnOrdinal]."Period Start" = MatrixRecords[MATRIX_ColumnOrdinal]."Period End" then
            MachinePMRSchedule.SETRANGE(Date, MatrixRecords[MATRIX_ColumnOrdinal]."Period Start")
        else
            MachinePMRSchedule.SETRANGE(Date,
                  MatrixRecords[MATRIX_ColumnOrdinal]."Period Start", MatrixRecords[MATRIX_ColumnOrdinal]."Period End");
        if FreqG <> '' then
            MachinePMRSchedule.SETRANGE(Frequency, FreqG);
        MATRIX_CellData[MATRIX_ColumnOrdinal] := MachinePMRSchedule.COUNT();
    end;
}

