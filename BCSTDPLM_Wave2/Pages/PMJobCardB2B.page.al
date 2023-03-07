page 33000911 "PM Job Card B2B"
{

    Caption = 'PM Job Card';
    DeleteAllowed = true;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "PM Job Header B2B";
    SourceTableView = WHERE(Posted = CONST(false),
                            Type = CONST(PMR));

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
                    ToolTip = 'It Defines Sl No.';
                    Editable = false;
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Machine ID.';
                    Editable = false;
                }
                field("Equipment Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Display Machine Name.';
                    Editable = false;
                }
                field("Plant ID"; Rec."Plant ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Plant ID.';
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies Type.';
                    Editable = false;
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Start Date and Time.';
                }
                field("End Date Time"; Rec."End Date Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines End Date and Time.';
                }
                field("Time Duration"; Rec."Time Duration")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Duration.';
                    Visible = false;
                }
                field("Total Minutes"; Rec."Total Minutes")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Total duration.';
                    Editable = false;
                }
                field("Time(Hrs)"; Rec."Time(Hrs)")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Time in Hours.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Department code.';
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Project code.';
                    Editable = false;
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Frequency Name.';
                }
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Resource.';
                }
                field(Maintenance; Rec."Maintenance Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Maintenance type.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Status.';
                    OptionCaption = 'Open,Released';
                }
                field("Work Center"; Rec."Work Center")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Work center.';
                }
                field("Maintenance Unit"; Rec."Maintenance Unit")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Maintenance Unit.';
                }
                field("Meter Reading"; Rec."Meter Reading")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Meter Reading.';
                }

            }
            part(PMJobLine1; "PM Job Line B2B")
            {
                Caption = 'PMJobLine1';
                ApplicationArea = all;
                SubPageLink = "Job Header No." = FIELD("No."),
                              "Machine ID" = FIELD("Machine ID");
            }
            group(Details)
            {
                Caption = 'Details';
                field("Expected Resource Cost"; Rec."Expected Resource Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Expected Resource Cost.';
                }
                field("Expected Spares Cost"; Rec."Expected Spares Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Expected Spares Cost.';
                }
                field("Actual Resource Cost"; Rec."Actual Resource Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Actual Resource Cost.';
                }
                field("Actual Spares Cost"; Rec."Actual Spares Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Actual Spares Cost.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Created date.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Created By.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Vendor.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Display Vendor name.';
                }
                field("A.M.C"; Rec."A.M.C")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Whether it is under AMC or Not.';
                    OptionCaption = '" ,Yes,No"';
                }
                field(Warranty; Rec.Warranty)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Whether it is under Warranty or Not.';
                    OptionCaption = '" ,Yes,No"';
                }
                field("Maintenance Date"; Rec."Maintenance Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Maintenance Date.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(PMJob)
            {
                Caption = 'PM &Job';
                action("Planned Worksheet")
                {
                    Caption = 'Planned Worksheet';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Planned Works against The Job card.';
                    Image = PlanningWorksheet;
                    RunObject = Page "PM Job OP Particulars B2B";
                    RunPageLink = "Job Card No." = FIELD("No.");
                }
                action("Work Sheet")
                {
                    Caption = 'Work Sheet';
                    ApplicationArea = all;
                    ToolTip = 'It is used to create Planned Works against The Job card.';
                    Image = Worksheet;

                    trigger OnAction();
                    begin
                        Rec.TESTFIELD("Maintenance Type");
                        Rec.TESTFIELD(Status, Rec.Status::Released);
                        worksheet.RESET();
                        worksheet.SETRANGE("Job Card No.", Rec."No.");
                        worksheet.SETRANGE("Machine ID", Rec."Machine ID");
                        PAGE.RUN(33000916, worksheet);
                    end;
                }
                action(Comments)
                {
                    Caption = 'Comments';
                    ApplicationArea = all;
                    ToolTip = 'Used to Define Comments.';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        CurrPage.PMJobLine1.PAGE.ShowComments();
                    end;
                }
                action("<Action1102154066>")
                {
                    Caption = 'Specs';
                    ApplicationArea = all;
                    ToolTip = 'Define Specifications.';
                    Image = SpecialOrder;

                    trigger OnAction();
                    begin

                        CLEAR(EquipmentCheckForm);
                        EquipmentCheckList.SETRANGE(EquipmentCheckList."Machine ID", Rec."Machine ID");
                        EquipmentCheckList.SETRANGE(Type, EquipmentCheckList.Type::Specs);
                        EquipmentCheckForm.SetJobNo(Rec."No.");
                        EquipmentCheckForm.SETTABLEVIEW(EquipmentCheckList);
                        EquipmentCheckForm.RUNMODAL();
                    end;
                }
                group("Sub Contracting")
                {
                    Caption = 'Sub Contracting';
                    Image = ViewOrder;
                    action("<Action1102152006>")
                    {
                        Caption = 'Sub Contract &Work Sheet';
                        ApplicationArea = all;
                        ToolTip = 'Used to Show Subcontracting related Data.';
                        Image = Worksheet;

                        trigger OnAction();
                        begin

                            SubconWorkSheet.RESET();
                            SubconWorkSheet.SETRANGE("Machine Id", Rec."Machine ID");
                            SubconWorkSheet.SETRANGE("Job Card No.", Rec."No.");
                            if SubconWorkSheet.FINDFIRST() then
                                if PurchHeader."No." = SubconWorkSheet."Purchase Order No." then begin
                                    PurchHeader.RESET();
                                    PurchHeader.SETRANGE("Machine Id B2B", SubconWorkSheet."Machine Id");
                                    PurchHeader.SETRANGE("Job Card No. B2B", SubconWorkSheet."Job Card No.");
                                    PAGE.RUN(33000897, SubconWorkSheet);
                                end
                                else
                                    ERROR('');
                        end;
                    }
                    action("Sub Contract &Order")
                    {
                        Caption = 'Sub Contract &Order';
                        ApplicationArea = all;
                        ToolTip = 'Used to create subcontracing order.';
                        Image = "Order";

                        trigger OnAction();
                        begin

                            SubconWorkSheet.RESET();
                            SubconWorkSheet.SETRANGE("Machine Id", Rec."Machine ID");
                            SubconWorkSheet.SETRANGE("Job Card No.", Rec."No.");
                            if SubconWorkSheet.FINDFIRST() then
                                if PurchHeader."No." <> SubconWorkSheet."Purchase Order No." then begin
                                    PurchHeader.RESET();
                                    PurchHeader.SETRANGE("Machine Id B2B", SubconWorkSheet."Machine Id");
                                    PurchHeader.SETRANGE("Job Card No. B2B", SubconWorkSheet."Job Card No.");
                                    PAGE.RUN(0, PurchHeader);
                                end;
                        end;
                    }
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                action("Procedure")
                {
                    Caption = 'Procedure';
                    ApplicationArea = all;
                    ToolTip = 'Used to Check the Procedure.';
                    Image = AddWatch;

                    trigger OnAction();
                    begin
                        CurrPage.PMJobLine1.PAGE.ShowJobLineProcedures();
                    end;
                }
                action("Safety Information")
                {
                    Caption = 'Safety Information';
                    ApplicationArea = all;
                    ToolTip = 'Define Safety Info.';
                    Image = Info;
                    RunObject = Page "Job Card Line Safety Info B2B";
                    RunPageLink = "Job Card No." = FIELD("No."),
                                  "Machine ID" = FIELD("Machine ID");
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    ApplicationArea = all;
                    ToolTip = 'It performs Release Action.';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin

                        Rec.TESTFIELD("Start Date Time");
                        Rec.TESTFIELD("End Date Time");
                        Rec.ReleaseStatus();
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    ApplicationArea = all;
                    ToolTip = 'It Performs reopen Action.';
                    Image = ReOpen;

                    trigger OnAction();
                    begin
                        Rec.CheckWorkSheet();
                        Rec.ReopenStatus();
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("P&ost")
                {
                    Caption = 'P&ost';
                    ApplicationArea = all;
                    ToolTip = 'It Perform posting action.';
                    Ellipsis = true;
                    Image = Post;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin

                        Rec.TESTFIELD(Status, Rec.Status::Released);
                        Rec.TESTFIELD("Start Date Time");
                        Rec.TESTFIELD("End Date Time");
                        Rec.CheckWorkSheet();

                        worksheet.RESET();
                        worksheet.SETRANGE("Job Card No.", Rec."No.");
                        if worksheet.FINDFIRST() then begin
                            if not worksheet.Posted then
                                ERROR(Text0005Lbl);
                        end else
                            ERROR(Text0006Lbl);



                        if not CONFIRM(Text001Lbl, false) then
                            exit;
                        if Rec."Time(Hrs)" < 0 then
                            ERROR(Text003Lbl);


                        Rec.PostEquipmentJournal(Rec);

                        Rec.Posted := true;
                        Rec."Posted Date" := WORKDATE();
                        Rec."Posted By" := format(USERID());
                        Rec."Total Cost" := Rec."Actual Resource Cost" + Rec."Actual Spares Cost";
                        Rec.MODIFY();
                        PMJobLine.SETRANGE("Job Header No.", Rec."No.");
                        if PMJobLine.FIND('-') then
                            repeat
                                PMJobLine.Posted := true;
                                PMJobLine.MODIFY();
                            until PMJobLine.NEXT() = 0;


                        BreakDownRec.SETRANGE("Complaint No.", Rec."Complaint No.");
                        if BreakDownRec.FINDFIRST() then begin
                            BreakDownRec."Job Card Posted" := true;
                            BreakDownRec.MODIFY();
                        end;

                        Rec.UpdateWorkSheet();
                        CurrPage.UPDATE();
                    end;
                }
            }
            group(ActionGroup3)
            {
                Caption = 'Print';
                action(Print)
                {
                    Caption = 'Print';
                    PromotedOnly = true;
                    ApplicationArea = all;
                    ToolTip = 'It Performs Print Action.';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin

                        PMJobHeaderGRec.RESET();
                        PMJobHeaderGRec.SETRANGE("No.", Rec."No.");
                        REPORT.RUNMODAL(33000906, GUIALLOWED(), false, PMJobHeaderGRec)
                    end;
                }
            }
        }
    }

    var
        PMJobLine: Record "PM Job Line B2B";
        worksheet: Record "Work Sheet B2B";
        BreakDownRec: Record "Breakdown Records B2B";
        SubconWorkSheet: Record "SubCon WorkSheet B2B";
        EquipmentCheckList: Record "Equipment Check List B2B";
        PurchHeader: Record "Purchase Header";
        PMJobHeaderGRec: Record "PM Job Header B2B";
        EquipmentCheckForm: Page "Equipment Check Lists (JC) B2B";
        Text001Lbl: Label 'Do you want post Job Card ?';
        Text003Lbl: Label 'End Time Should be greater than Start Time';
        Text0005Lbl: Label 'Work Sheet not posted.';
        Text0006Lbl: Label 'Work Sheet Empty.';

}

