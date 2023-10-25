using System;
using UnityEngine;

// Token: 0x02000031 RID: 49
public class MyPauseMenu2 : MonoBehaviour
{
	// Token: 0x060000D4 RID: 212 RVA: 0x00004697 File Offset: 0x00002897
	private void Start()
	{
		this.pauseMenuUI.SetActive(false);
		Time.timeScale = 1f;
		MyPauseMenu2.GameIsPaused = false;
	}

	// Token: 0x060000D5 RID: 213 RVA: 0x000046B5 File Offset: 0x000028B5
	private void Update()
	{
		if (Input.GetKeyDown(KeyCode.Escape))
		{
			if (MyPauseMenu2.GameIsPaused)
			{
				this.Resume();
				return;
			}
			this.Pause();
		}
	}

	// Token: 0x060000D6 RID: 214 RVA: 0x000046D4 File Offset: 0x000028D4
	public void Resume()
	{
		Cursor.visible = false;
		Cursor.lockState = CursorLockMode.Locked;
		this.pauseMenuUI.SetActive(false);
		Time.timeScale = 1f;
		MyPauseMenu2.GameIsPaused = false;
	}

	// Token: 0x060000D7 RID: 215 RVA: 0x000046FE File Offset: 0x000028FE
	private void Pause()
	{
		Cursor.visible = true;
		Cursor.lockState = CursorLockMode.None;
		this.pauseMenuUI.SetActive(true);
		Time.timeScale = 0f;
		MyPauseMenu2.GameIsPaused = true;
	}

	// Token: 0x040000B9 RID: 185
	public static bool GameIsPaused;

	// Token: 0x040000BA RID: 186
	public GameObject pauseMenuUI;
}
