using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x02000015 RID: 21
public class Ending01 : MonoBehaviour
{
	// Token: 0x06000053 RID: 83 RVA: 0x00003096 File Offset: 0x00001296
	private void Start()
	{
		base.Invoke("EndGame", 20f);
	}

	// Token: 0x06000054 RID: 84 RVA: 0x000030A8 File Offset: 0x000012A8
	public void EndGame()
	{
		SceneManager.LoadScene("MainMenu");
	}
}
