#!/bin/bash
tar cvvf backup/home.tar |

mv /var/backup/home.tar /var/backup/home.last.tar |

ls -l /var/backup > /var/backup/disk/file_report.txt |

free -h
