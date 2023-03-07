page 33000974 "Test Condition Card B2B"
{

    AutoSplitKey = false;
    Caption = 'Test Condition Card';
    PageType = Card;
    SourceTable = "Test Condition B2B";
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {

                    ApplicationArea = all;
                    ToolTip = 'It Defines No.';

                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.UPDATE();
                    end;
                }
                field("Machine Id"; Rec."Machine Id")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Machine ID.';

                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Machine Name.';

                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Date.';

                }
                field(Condition; Rec.Condition)
                {
                    Editable = ConditionEditable;
                    OptionCaption = '" ,OK,Not OK"';
                    ApplicationArea = all;
                    ToolTip = 'It Defines COndition.';

                }
                field("Test Description"; Rec."Test Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description.';

                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines remarks.';

                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Posting)
            {
                Caption = 'P&osting';
                action(Post)
                {
                    Caption = 'Post';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Posting Funtion.';

                    Image = Post;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin


                        Rec.TESTFIELD(Date);
                        Rec.TESTFIELD(Condition);
                        Rec.TESTFIELD("Test Description");
                        Rec.TESTFIELD(Remarks);
                        if Rec.Posted then
                            ERROR(TestConditionErr);

                        Equipment.RESET();
                        Equipment.SETRANGE("No.", Rec."Machine Id");
                        if Equipment.FINDFIRST() then
                            if Equipment."Year of Purchase" > Rec.Date then
                                ERROR(EquipmentDateErr);

                        if Rec.Condition = Rec.Condition::"Not OK" then begin
                            PlantMaintenanceSetup.GET();
                            PMJobHeaderRec.INIT();
                            PMJobHeaderRec."No." := NoSeriesMgt.GetNextNo(PlantMaintenanceSetup."Others Job Card", TODAY(), true);
                            PMJobHeaderRec."Machine ID" := Rec."Machine Id";
                            PMJobHeaderRec."Machine Name" := Rec."Machine Name";
                            PMJobHeaderRec.Type := PMJobHeaderRec.Type::Predictive;
                            PMJobHeaderRec."Test Description" := Rec."Test Description";
                            PMJobHeaderRec."Created By" := Format(USERID());
                            PMJobHeaderRec."Created Date" := TODAY();
                            PMJobHeaderRec."Created Time" := TIME();
                            PMJobHeaderRec.INSERT(true);

                            PMJobLineRec.INIT();
                            PMJobLineRec."Job Header No." := PMJobHeaderRec."No.";
                            PMJobLineRec."Line No." := 10000;
                            PMJobLineRec."Machine ID" := Rec."Machine Id";

                            PMJobLineRec.Description := Rec."Test Description";
                            PMJobLineRec.INSERT(true);
                            Rec.VALIDATE("Job Card No.", PMJobHeaderRec."No.");
                            Rec.Posted := true;
                            Rec.MODIFY();
                            MESSAGE(Text001Lbl, PMJobHeaderRec."No.");
                        end else begin
                            Rec.Posted := true;
                            Rec.MODIFY();
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        if Rec.Posted then
            ConditionEditable := false
        else
            ConditionEditable := true;
    end;

    trigger OnInit();
    begin
        ConditionEditable := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        if Rec.Posted then
            ConditionEditable := false
        else
            ConditionEditable := true;
    end;

    trigger OnOpenPage();
    begin
        if Rec.Posted then
            ConditionEditable := false
        else
            ConditionEditable := true;
    end;

    var
        PlantMaintenanceSetup: Record "Plant Maintenance Setup B2B";
        PMJobHeaderRec: Record "PM Job Header B2B";
        Equipment: Record "Equipment B2B";
        PMJobLineRec: Record "PM Job Line B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text001Lbl: Label 'Job Card Created with Job no. :%1 Successfully for Predictive.', Comment = '%1 = No.';
        [InDataSet]
        ConditionEditable: Boolean;
        TestConditionErr: Label 'Test condition already posted.';
        EquipmentDateErr: Label 'Date must not be less than Equipment Date of Installed.';
}

