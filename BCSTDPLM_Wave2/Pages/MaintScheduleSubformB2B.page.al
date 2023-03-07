page 33000900 "Maint. Schedule Subform B2B"
{

    AutoSplitKey = true;
    Caption = 'Maintainance Schedule Subform';
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Equipment Schedule Line B2B";
    SourceTableView = SORTING("Schedule Template ID", "Line No.");

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                field("Sl.No."; Rec."Sl.No.")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Serial Number in the Subform.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Line typre in the Maintenance schedule Subform.';

                    trigger OnValidate();
                    begin
                        EditableFields();
                    end;
                }
                field("Line Type Name"; Rec."Line Type Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Displays the Line type Name in The Maintenance Schedule Subform.';
                    Editable = false;
                    Visible = false;
                }
                field("I/R Code"; Rec."I/R Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the I/R Code in the Subform.';
                    Caption = 'Code';
                }
                field("I/R Description"; Rec."I/R Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the I/R Code description in the Subform.';
                }
                field("Time Required"; Rec."Time Required")
                {
                    Editable = "Time RequiredEditable";
                    ApplicationArea = all;
                    ToolTip = 'This field Shows the time Required.';
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = QuantityEditable;
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Quantity.';
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Unit Of Measure.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Unit cost.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Amount.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Description.';
                    Caption = 'Remarks';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        EditableFields();
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        EditableFields();
    end;

    trigger OnOpenPage();
    begin
        EditableFields();
    end;

    var
        [InDataSet]
        "Time RequiredEditable": Boolean;
        [InDataSet]
        QuantityEditable: Boolean;

    procedure EditableFields();
    begin
        if (Rec."Resource Equipment" or Rec."Resource Person") then begin
            "Time RequiredEditable" := true;
            QuantityEditable := false;
        end else begin
            "Time RequiredEditable" := false;
            QuantityEditable := true;
        end;
    end;
}

