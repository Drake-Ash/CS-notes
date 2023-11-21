---

database-plugin: basic

---

```yaml:dbfolder
name: dsa problems
description: solve dsa problems and notes for the same
columns:
  __file__:
    key: __file__
    id: __file__
    input: markdown
    label: File
    accessorKey: __file__
    isMetadata: true
    skipPersist: false
    isDragDisabled: false
    csvCandidate: true
    position: 2
    isHidden: false
    sortIndex: -1
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: true
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  Status:
    input: select
    accessorKey: Status
    key: Status
    id: Status
    label: Status
    position: 4
    skipPersist: false
    isHidden: false
    sortIndex: -1
    width: 255
    options:
      - { label: "Complete | Pending review", value: "Complete | Pending review", color: "hsl(217, 95%, 90%)"}
      - { label: "Pending", value: "Pending", color: "hsl(86, 95%, 90%)"}
      - { label: "Review again", value: "Review again", color: "hsl(148, 95%, 90%)"}
      - { label: "Complete", value: "Complete", color: "hsl(13, 95%, 90%)"}
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  To_review:
    input: checkbox
    accessorKey: To_review
    key: To_review
    id: To_review
    label: To review
    position: 6
    skipPersist: false
    isHidden: false
    sortIndex: -1
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  __created__:
    key: __created__
    id: __created__
    input: metadata_time
    label: Created
    accessorKey: __created__
    isMetadata: true
    isDragDisabled: false
    skipPersist: false
    csvCandidate: true
    position: 9
    isHidden: false
    sortIndex: 1
    isSorted: true
    isSortedDesc: false
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  __modified__:
    key: __modified__
    id: __modified__
    input: metadata_time
    label: Modified
    accessorKey: __modified__
    isMetadata: true
    isDragDisabled: false
    skipPersist: false
    csvCandidate: true
    position: 10
    isHidden: true
    sortIndex: -1
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  __tasks__:
    key: __tasks__
    id: __tasks__
    input: task
    label: Task
    accessorKey: __tasks__
    isMetadata: true
    isDragDisabled: false
    skipPersist: false
    csvCandidate: false
    position: 8
    isHidden: false
    sortIndex: -1
    width: 280
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  __tags__:
    key: __tags__
    id: __tags__
    input: metadata_tags
    label: File Tags
    accessorKey: __tags__
    isMetadata: true
    isDragDisabled: false
    skipPersist: false
    csvCandidate: false
    position: 7
    isHidden: false
    sortIndex: -1
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  Link:
    input: text
    accessorKey: Link
    key: Link
    id: Link
    label: Link
    position: 1
    skipPersist: false
    isHidden: false
    sortIndex: -1
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  Difficulty:
    input: select
    accessorKey: Difficulty
    key: Difficulty
    id: Difficulty
    label: Difficulty
    position: 5
    skipPersist: false
    isHidden: false
    sortIndex: -1
    options:
      - { label: "easy", value: "easy", color: "hsl(15, 95%, 90%)"}
      - { label: "medium", value: "medium", color: "hsl(81, 95%, 90%)"}
      - { label: "hard", value: "hard", color: "hsl(337, 95%, 90%)"}
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  Time_in_minutes:
    input: number
    accessorKey: Time_in_minutes
    key: Time_in_minutes
    id: Time
    label: Time in minutes
    position: 3
    skipPersist: false
    isHidden: false
    sortIndex: -1
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
config:
  remove_field_when_delete_column: true
  cell_size: normal
  sticky_first_column: true
  group_folder_column: 
  remove_empty_folders: false
  automatically_group_files: false
  hoist_files_with_empty_attributes: true
  show_metadata_created: true
  show_metadata_modified: true
  show_metadata_tasks: true
  show_metadata_inlinks: false
  show_metadata_outlinks: false
  show_metadata_tags: true
  source_data: tag
  source_form_result: "#dsa"
  source_destination_path: CS/Problems
  row_templates_folder: templates
  current_row_template: templates/Problems template.md
  pagination_size: 200
  font_size: 16
  enable_js_formulas: false
  formula_folder_path: /
  inline_default: false
  inline_new_position: last_field
  date_format: yyyy-MM-dd
  datetime_format: "yyyy-MM-dd HH:mm:ss"
  metadata_date_format: "yyyy-MM-dd HH:mm:ss"
  enable_footer: false
  implementation: default
filters:
  enabled: true
  conditions:
      - condition: AND
        disabled: false
        label: "remove template file"
        color: "hsl(0,0%,0%)"
        filters:
        - field: file.name
          operator: NOT_CONTAINS
          value: "template"
          type: text
      - condition: AND
        disabled: false
        label: "remove finished"
        color: "hsl(116,34%,25%)"
        filters:
        - field: Status
          operator: NOT_CONTAINS
          value: "Complete"
          type: select
        - field: Status
          operator: NOT_CONTAINS
          value: "Review"
          type: select
```